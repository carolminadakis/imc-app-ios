//
//  ViewController.swift
//  LearningIos
//
//  Created by Ana Carolina Bernardes Minadakis on 15/09/21.
//

import UIKit

//Essa é a classe vinculada a tela
class ViewController: UIViewController {

    //Essas 4 variáveis abaixo representam os componentes da tela (peso, altura, label, imagem e a da view)
    //e serão usadas para pegar as informações do usuário e apresentar o resultado
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //será executado sempre que tocar na tela, menos quando em parte de texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

//irá calcular o resultado
    @IBAction func calculate(_ sender: Any) {
        //recuperar a inforação entrada pelo usuário
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
            imc = weight / pow(height, 2)   //a função pow pega o primeiro valor e eleva ao segundo valor
            showResults()
        }
    }
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        //Atribuindo o valor calculado as variáveis de componente na tela
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        //valido a exposição da view, pois a início ele está escondida
        viResult.isHidden = false
        //finaliza a edição na view, some o teclado
        view.endEditing(true)
    }
}

