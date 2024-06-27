import UIKit

/// Экран показа и настройки Label
final class FirstSettingsViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Private Properties
    private var myLabel = UILabel()
    private var mySlider = UISlider()
    private var colourPicker = UIPickerView()
    private var numberOfLinesPicker = UIPickerView()
    private var shadowLabel = UILabel()
    private var shadowSwitch = UISwitch()
    
    private let colourArray = ["черный", "красный", "зеленый", "синий", "оранжевый"]
    private let colors: [UIColor] = [.black, .red, .green, .blue, .orange]
    private let numberOfLinesArray = [Int](0...9)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Первый экран"
        setupForView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Private Methods
    private func setupForView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alertTarget))
        
        myLabel.frame = CGRect(x: 0, y: 200, width: 300, height: 100)
        myLabel.lineBreakMode = .byClipping
        myLabel.center.x = view.center.x
        myLabel.textAlignment = .justified
        myLabel.textColor = .black
        myLabel.font = UIFont.systemFont(ofSize: 5)
        view.addSubview(myLabel)
        
        mySlider.frame = CGRect(x: 0, y: 400, width: 300, height: 30)
        mySlider.center.x = view.center.x
        mySlider.minimumValue = 5
        mySlider.maximumValue = 50
        view.addSubview(mySlider)
        mySlider.addTarget(self, action: #selector(sliderValueChanged(sender:)), for: .valueChanged)
        
        
        colourPicker.frame = CGRect(x: 25, y: 450, width: 160, height: 200)
        colourPicker.delegate = self
        colourPicker.dataSource = self
        view.addSubview(colourPicker)
        
        numberOfLinesPicker.frame = CGRect(x: 250, y: 450, width: 150, height: 200)
        numberOfLinesPicker.delegate = self
        numberOfLinesPicker.dataSource = self
        view.addSubview(numberOfLinesPicker)
        
        shadowLabel.frame = CGRect(x: 50, y: 750, width: 100, height: 30)
        shadowLabel.text = "Shadow"
        shadowLabel.font = UIFont.boldSystemFont(ofSize: 20)
        shadowLabel.textColor = .black
        view.addSubview(shadowLabel)
        
        shadowSwitch.frame = CGRect(x: 0, y: 750, width: 100, height: 30)
        shadowSwitch.isOn = false
        shadowSwitch.center.x = view.center.x
        view.addSubview(shadowSwitch)
        shadowSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }
    
    @objc private func alertTarget() {
        let alertController = UIAlertController(title: "Введите текст", message: "", preferredStyle: .alert)
        alertController.addTextField()
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            guard let text = alertController.textFields?.first?.text else { return }
            self.myLabel.text = text
        }
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc private func sliderValueChanged(sender: UISlider) {
        myLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
    }
    
    @objc private func switchValueChanged() {
        if shadowSwitch.isOn {
            myLabel.shadowColor = .lightGray
            myLabel.shadowOffset = CGSize(width: 2, height: 2)
        } else {
            myLabel.shadowColor = .none
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

/// UIPickerViewDelegate, UIPickerViewDataSource
extension FirstSettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case colourPicker: return colourArray.count
        case numberOfLinesPicker: return numberOfLinesArray.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case colourPicker: return colourArray[row]
        case numberOfLinesPicker: return "\(numberOfLinesArray[row])"
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == colourPicker {
            myLabel.textColor = colors[row]
        } else {
            myLabel.numberOfLines = numberOfLinesArray[row]
        }
    }
}
