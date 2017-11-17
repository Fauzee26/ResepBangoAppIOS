//
//  ResepTableViewController.swift
//  ResepBangoAppIOS
//
//  Created by Muhammad Hilmy Fauzi on 17/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ResepTableViewController: UITableViewController {

    var namaSelected:String?
    var waktuSelected:String?
    var orangSelected:String?
    var hargaSelected:String?
    var bahanSelected:String?
    var caraSelected:String?
    
    var arraySiswa = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let params = ["id_resep" : nampungId!]
        let url = "http://localhost/resepBango/index.php/api/getResep"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            //check response
            if response.result.isSuccess {
                let json = JSON(response.result.value as Any)
                print(json)
                self.arraySiswa = json["List Resep"].arrayObject as! [[String : String]]
                
                if(self.arraySiswa.count > 0){
                    self.tableView.reloadData()
                }
            }else{
                print("Error Server")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraySiswa.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResepTableViewCell

        var serverid = arraySiswa[indexPath.row]
        
        var id = serverid["id_resep"]
        let nama = serverid["namaResep"]
        let waktu = serverid["lamaPengerjaan"]
        let orang = serverid["jumlahOrang"]
        let harga = serverid["harga"]

        
        //pindahkan ke cell
        cell.labelResep.text = nama
        cell.labelWaktu.text = waktu
        cell.labelOrang.text = orang
        cell.labelHarga.text = harga
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arraySiswa[indexPath.row]
        
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = task["namaResep"] as? String
        waktuSelected = task["lamaPengerjaan"] as? String
        orangSelected = task["jumlahOrang"] as? String
        hargaSelected = task["harga"] as? String
        bahanSelected = task["bahan"] as? String
        caraSelected = task["caraMasak"] as? String
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "segue"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let value = arraySiswa[indexPath.row]
                controller.passnama = value["namaResep"] as? String
                controller.passwaktu = value["lamaPengerjaan"] as? String
                controller.passorang = value["jumlahOrang"] as? String
                controller.passharga = value["harga"] as? String
                controller.passbahan = value["bahan"] as? String
                controller.passcara = value["caraMasak"] as? String
            }
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
