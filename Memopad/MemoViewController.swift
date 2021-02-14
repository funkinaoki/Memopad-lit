//
//  MemoViewController.swift
//  Memopad
//
//  Created by 八幡尚希 on 2021/02/05.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    //step1:userdefaultsにアクセス
    var saveData: UserDefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //step3: 鍵を使って値を取り出す
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
        
    }
    
    
    
    @IBAction func saveMemo() {
        //step2: 鍵を使ってUserDefaultsの書き込み
        saveData.set(titleTextField.text ,forKey: "title")
        saveData.set(contentTextView.text ,forKey: "content")
        
        //alertを出す
        let alert: UIAlertController = UIAlertController(title:"保存", message: "メモの保存が完了いたしました。", preferredStyle: .alert)
        
        //OKボタンを表示
        alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: { action in
                            //押された際のアクション
                            self.navigationController?.popViewController(animated: true)
                        }
                    )
        )
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        present(alert, animated: true, completion: nil)
    }
    


}
