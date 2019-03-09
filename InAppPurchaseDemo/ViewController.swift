//
//  ViewController.swift
//  InAppPurchaseDemo
//
//  Created by Michael Miles on 3/8/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKPaymentTransactionObserver {
    
    let productID = "com.michaelgagemiles.InAppPurchaseDemo.PurchaseExample"
    
    @IBOutlet weak var purchaseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)
        
        purchaseLabel.text = "Purchase not completed yet"
    }
    
    @IBAction func purchasePressed(_ sender: Any) {
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
        } else {
            print("User unable to make payments")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                //if item has been purchased
                print("Transaction Successful")
                purchaseLabel.text = "Purchase Completed!"
            } else if transaction.transactionState == .failed {
                print("Transaction Failed")
            }
        }
    }

}

