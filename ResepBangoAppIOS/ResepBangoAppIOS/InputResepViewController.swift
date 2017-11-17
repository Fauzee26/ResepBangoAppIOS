//
//  InputResepViewController.swift
//  ResepBangoAppIOS
//
//  Created by Muhammad Hilmy Fauzi on 17/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class InputResepViewController: UIViewController {

    @IBOutlet weak var etNama: UITextField!
    @IBOutlet weak var etWaktu: UITextField!
    @IBOutlet weak var etOrang: UITextField!
    @IBOutlet weak var etHarga: UITextField!
    @IBOutlet weak var etBahan: UITextField!
    @IBOutlet weak var etCara: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnInput(_ sender: Any) {
        let nilaiNama = etNama.text
        let nilaiWaktu = etWaktu.text
        let nilaiOrang = etOrang.text
        let nilaiHarga = etHarga.text
        let nilaiBahan = etBahan.text
        let nilaiCara = etCara.text
        
        if ((nilaiNama?.isEmpty)! || (nilaiWaktu?.isEmpty)! || (nilaiOrang?.isEmpty)! || (nilaiHarga?.isEmpty)! || (nilaiBahan?.isEmpty)! || (nilaiCara?.isEmpty)!) {
            
            //muncul alert dialog
            let alertWarning = UIAlertController(title: "Warning", message: "This Is Required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            
            //apabila widget tidak kosong
            //membuat parameter untuk disimpan ke database
            let params = ["namaResep" : nilaiNama!, "lamaPengerjaan" : nilaiWaktu!, "jumlahOrang" : nilaiOrang!, "harga" : nilaiHarga!, "bahan" : nilaiBahan!, "caraMasak" : nilaiCara!]
            //mencetak nilai params yang dikirim
            print(params)
            
            let url = "http://localhost/resepBango/index.php/api/tambahResep"
            
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
                    let story = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                    let id = story.instantiateViewController(withIdentifier: "welcome")
                    self.show(id, sender: self)
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
