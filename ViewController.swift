import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var themeSwitch: UISwitch!
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if let isNight = defaults.value(forKey: "isNight") {
            if isNight as! Bool {
                switchToNight()
            }
        }
    }

    @IBAction func switchFlipped(sender: Any) {
        if themeSwitch.isOn {
            switchToNight() // quando o usuário habilitar Dark Mode iremos ativar a funcao
            defaults.set(true, forKey: "isNight")//Deixando o botao Dark Mode ativado.
        } else { // chamando o else caso nao seja verdadeiro
            switchToDay()
            defaults.set(false, forKey: "isNight")
        }
    }
    
    func switchToNight() {
        themeSwitch.setOn(true, animated: false)
        overrideUserInterfaceStyle = .dark //Metodo da gente poder chamar o Dark Mode
    }
    
    func switchToDay() {
        themeSwitch.setOn(false, animated: false)
        overrideUserInterfaceStyle = .light // funcao para dizer que é light
    }
}
