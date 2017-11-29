//
//  TerminalsViewController.swift
//  MidtermProject
//
//  Created by Francine Halczli on 11/5/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
//

import UIKit
import WebKit
import Firebase


class TerminalsViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Active Terminals"
        
        let mySite = "http://finkletrucking.com/our_terminals.htm"
        let url = URL(string: mySite)
        let request = URLRequest (url: url!)
        
        webView = WKWebView (frame: self.view.frame)
        
        webView.navigationDelegate = self
        webView.load(request)
        self.view.addSubview(webView)

        // Do any additional setup after loading the view.
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
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start to load")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish to load")
    }

}
