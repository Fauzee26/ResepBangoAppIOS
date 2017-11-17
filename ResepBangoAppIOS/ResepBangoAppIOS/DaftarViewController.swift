//
//  DaftarViewController.swift
//  ResepBangoAppIOS
//
//  Created by Muhammad Hilmy Fauzi on 17/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DaftarViewController: UIViewController {

    @IBOutlet weak var etUsername: UITextField!
    @IBOutlet weak var etEmail: UITextField!
    @IBOutlet weak var etPassword: UITextField!
    @IBOutlet weak var etAlamat: UITextField!
    @IBOutlet weak var etTelp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnDaftar(_ sender: Any) {
        let nilaiUser = etUsername.text
        let nilaiEmail = etEmail.text
        let nilaiPassword = etPassword.text
        let nilaiTelp = etTelp.text
        let nilaiAlamat = etAlamat.text
        
        if ((nilaiUser?.isEmpty)! || (nilaiEmail?.isEmpty)! || (nilaiPassword?.isEmpty)! || (nilaiAlamat?.isEmpty)! || (nilaiTelp?.isEmpty)!) {
            
            //muncul alert dialog
            let alertWarning = UIAlertController(title: "Warning", message: "This Is Required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            
            //apabila widget tidak kosong
            //membuat parameter untuk disimpan ke database
            let params = ["email" : nilaiEmail!, "password" : nilaiPassword!, "username" : nilaiUser!, "alamat" : nilaiAlamat!, "noTelp" : nilaiTelp!]
            //mencetak nilai params yang dikirim
            print(params)
            
            let url = "http://localhost/resepBango/index.php/api/daftar"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {
                (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    //muncul alert dialog
                    let alertWarning = UIAlertController(title: "Congrats", message: "Data Berhasil Disimpan", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion: nil)
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
