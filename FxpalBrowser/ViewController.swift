//
//  ViewController.swift
//  FxpalBrowser
//
//  Created by Yulius Tjahjadi on 10/14/19.
//  Copyright © 2019 White Tea LLC. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.fxpal.com")!
        let urlRequest = URLRequest(url: url)
        self.webView.load(urlRequest)
        
        self.webView.navigationDelegate = self
        
        self.urlView.delegate = self
    }
    

    @IBAction func onClickForward(_ sender: Any) {
        self.webView.goForward()
    }
    @IBAction func onClickBackward(_ sender: Any) {
        self.webView.goBack()
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.urlView.text = self.webView.url?.absoluteString
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let urlString = textField.text,
            let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            self.webView.load(urlRequest)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textField.endEditing(true)
            return false
        }
        
        return true
    }
}

