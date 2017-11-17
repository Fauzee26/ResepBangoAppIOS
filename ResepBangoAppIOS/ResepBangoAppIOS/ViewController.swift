//
//  ViewController.swift
//  ResepBangoAppIOS
//
//  Created by Muhammad Hilmy Fauzi on 17/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblnama: UILabel!
    @IBOutlet weak var lblwaktu: UILabel!
    @IBOutlet weak var lblorang: UILabel!
    @IBOutlet weak var lblharga: UILabel!
    @IBOutlet weak var lblbahan: UITextView!
    @IBOutlet weak var lblcara: UITextView!
    
    var passnama:String?
    var passwaktu:String?
    var passorang:String?
    var passharga:String?
    var passbahan:String?
    var passcara:String?
    override func viewDidLoad() {
        
        lblnama.text = passnama!
        lblwaktu.text = passwaktu!
        lblorang.text = passorang!
        lblharga.text = passharga!
        lblbahan.text = passbahan!
        lblcara.text = "Jenis Kelamin: " + passcara!
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

