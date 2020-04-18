//
//  ViewController.swift
//  DeniseApp
//
//  Created by ijsf on 6/24/18.
//  Copyright © 2018-2020 C.E. Etheredge. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var webView: WKWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad();
        
        webView.configuration.userContentController.add(self, name: "deniseNotificationSet");
        webView.configuration.userContentController.add(self, name: "deniseNotificationReset");

        let url = URL(string: "https://localhost:4444");
        let urlRequest = URLRequest(url: url!);
        webView.load(urlRequest);
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "deniseNotificationSet":
            print("deniseNotificationSet")
            // Notification set
            let appDelegate = NSApplication.shared.delegate as! AppDelegate
            appDelegate.setIcon(iconName: "statusActiveIcon");
            break
        case "deniseNotificationReset":
            print("deniseNotificationReset")
            // Notification reset
            let appDelegate = NSApplication.shared.delegate as! AppDelegate
            appDelegate.setIcon(iconName: "statusIcon");
            break
        default:
            break
        }
    }
}
