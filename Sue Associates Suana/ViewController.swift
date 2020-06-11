//
//  ViewController.swift
//  Sue Associates Suana
//
//  Created by Cameron on 6/9/20.
//  Copyright © 2020 Cameron Nagai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var confirmationMessage = ""
    private var showingConfirmation = false

    var isOn: Bool!
    @IBOutlet var suanaLabel: UILabel!
    @IBAction func `switch`(_ sender: UISwitch) {
        if (sender.isOn == true) {
            submitAction()
            isOn = true
            output.text = "Suana is On"

            
        }
        else {
            submitActionOff()
            isOn = false
            output.text = "Suana is Off"

            
        }
    }
    @IBOutlet weak var output: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func submitAction() {
        // Prepare URL
        let url = URL(string: "https://us-central1-sue-associates.cloudfunctions.net/sauna")
//        let url = URL(string: "https://ptsv2.com/t/4seyy-1591745383/post")
        // Check that the url is valid
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let json: [String: Any] = ["on": true]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        // Set HTTP Request Body
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.httpBody = jsonData
        // HTTP Request Parameters which will be sent in HTTP Request Body
        
//           let postString = "{\"on\":true}"
            // Set HTTP Request Body
//            request.httpBody = postString.data(using: String.Encoding.utf8);
            // Perform HTTP Request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
            }
            task.resume()
    }
        
        
        func submitActionOff() {
            // Prepare URL
            let url = URL(string: "https://us-central1-sue-associates.cloudfunctions.net/sauna")
//            let url = URL(string: "https://ptsv2.com/t/4seyy-1591745383/post")
            // Check that the url is valid
            guard let requestUrl = url else { fatalError() }
            // Prepare URL Request Object
            var request = URLRequest(url: requestUrl)
            request.httpMethod = "POST"
//            let postString = "{\"on\":false}"
            
            let json: [String: Any] = ["on": false]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            // Set HTTP Request Body
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
            request.httpBody = jsonData
            // Perform HTTP Request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
            }
            task.resume()
    }
}

