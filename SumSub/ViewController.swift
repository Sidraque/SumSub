//
//  ViewController.swift
//  SumSub
//
//  Created by Sidraque on 11/08/21.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tfNumber1: UITextField!
    @IBOutlet weak var tfNumber2: UITextField!
    @IBOutlet weak var btSumSub: UIButton!
    @IBOutlet weak var lbSumSub: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    
    
    var result: Double = 0
    var dados: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        dados.append("Somar")
        dados.append("Subtrair")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //Especifica o número de componentes que o PickerView irá ter.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    //Especifica a quantidade de elementos ou linhas que o PickerView irá ter.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return dados.count
        
    }
    
    //Utiliza para mostrar qual informação deve ser mostrado em cada linha do PickerView.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        return dados[row]
        
       
    }
    
    //Utiliza para mostrar item selecionado no pickerView e realizar mudanças de ações
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        print(dados[row])
        
        if row == 0 {
            btSumSub.setTitle("Somar", for: .normal)
            lbSumSub.text = "+"
        }else{
            btSumSub.setTitle("Subtrair", for: .normal)
            lbSumSub.text = "-"
        }
    
        
    }
    
    
    //Utiliza para alterar atributos do conteúdo do pickerView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = (view as? UILabel) ?? UILabel()
        
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        
        label.textAlignment = NSTextAlignment.center
        
        label.text = dados[row]
        
        return label
        
    }
    
    
    
    @IBAction func btSumSub(_ sender: UIButton) {
        
        guard let firstNumber = Double(tfNumber1.text!) else {return}
        guard let secondNumber = Double(tfNumber2.text!) else {return}
        
        
        if ((pickerView.selectedRow(inComponent: 0)) != 1){
            result = (firstNumber + secondNumber)
        }else{
            result = (firstNumber - secondNumber)
        }
        
        lbResult.text = "\(Double(result))"
        
    }
    
    
    
    

    


}

