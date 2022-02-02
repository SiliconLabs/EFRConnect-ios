//
//  SILWifiCommissioningPasswordPopup.swift
//  BlueGecko
//
//  Created by Grzegorz Janosz on 25/11/2021.
//  Copyright © 2021 SiliconLabs. All rights reserved.
//

protocol SILWifiCommissioningPasswordPopupDelegate: class {
    func didTappedOKButton(accessPoint: SILWifiCommissioningAccessPoint, password: String)
    func didTappedCancelButton()
}

class SILWifiCommissioningPasswordPopup: UIViewController {
    
    @IBOutlet weak var accessPointNameLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var delegate: SILWifiCommissioningPasswordPopupDelegate?
    var accessPoint: SILWifiCommissioningAccessPoint!
    
    override var preferredContentSize: CGSize {
        get {
            if UIDevice.current.userInterfaceIdiom == .pad {
                return CGSize(width: 400, height: 200)
            } else {
                return CGSize(width: 300, height: 200)
            }
        }
        set {
            super.preferredContentSize = newValue
        }
    }
    
    //MARK: View Controller LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.accessPointNameLabel.text = accessPoint.name
    }
    
    func showWrongPasswordAlert() {
        self.showToast(message: "Invalid password!", toastType: .disconnectionError, completion: {})
    }
    
    private func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    
    private func enterPassword() {
        self.dismissKeyBoard()
        
        guard let password = self.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !password.isEmpty else {
            self.showWrongPasswordAlert()
            self.view.endEditing(true)
            return
        }
        self.dismiss(animated: true, completion: nil)
        self.delegate?.didTappedOKButton(accessPoint: self.accessPoint, password: password)
    }
    
    //MARK:ACTION METHOD
    
    @IBAction func didTappedCancelBtn(_ sender: Any) {
        self.delegate?.didTappedCancelButton()
    }
    
    @IBAction func didTappedOKBtn(_ sender: Any) {
        self.enterPassword()
    }
}

//MARK: UITextFieldDelegate

extension SILWifiCommissioningPasswordPopup: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.enterPassword()
        return true
    }
}