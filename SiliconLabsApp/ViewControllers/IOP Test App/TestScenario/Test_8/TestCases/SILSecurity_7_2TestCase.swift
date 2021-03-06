//
//  SILSecurity_7_2TestCase.swift
//  BlueGecko
//
//  Created by Kamil Czajka on 25.3.2021.
//  Copyright © 2021 SiliconLabs. All rights reserved.
//

import Foundation

class SILSecurity_7_2TestCase: SILTestCase {
    var testResult: SILObservable<SILTestResult?> = SILObservable(initialValue: nil)
    var testID: String = "7.2"
    var testName: String = "Security and Encryption."
    
    var observableTokens: [SILObservableToken?] = []
    private var disposeBag = SILObservableTokenBag()
    
    private var securityTestHelper: SILIOPSecurityTestHelper
    
    private var iopTestPhase3TestSecurityPairing = SILIOPPeripheral.SILIOPTestPhase3.IOPTest_Security_Pairing.cbUUID
    private let InitialValue = "0x000100"
    private let ExceptedValue = "0x55"
    
    init() {
        securityTestHelper = SILIOPSecurityTestHelper(testedCharacteristic: iopTestPhase3TestSecurityPairing,
                                                      initialValue: InitialValue,
                                                      exceptedValue: ExceptedValue)
    }
    
    func injectParameters(parameters: Dictionary<String, Any>) {
        securityTestHelper.injectParameters(parameters: parameters)
    }
    
    func performTestCase() {
        weak var weakSelf = self
        let securityTestHelperResultSubscription = securityTestHelper.testResult.observe( { testResult in
            guard let weakSelf = weakSelf else { return }
            guard let testResult = testResult else { return }
            weakSelf.securityTestHelper.invalidateObservableTokens()
            weakSelf.publishTestResult(passed: testResult.passed, description: testResult.description)
        })
        disposeBag.add(token: securityTestHelperResultSubscription)
        observableTokens.append(securityTestHelperResultSubscription)
        
        publishStartTestEvent()
        securityTestHelper.performTestCase()
    }
    
    func getTestArtifacts() -> Dictionary<String, Any> {
        return [:]
    }
    
    func stopTesting() {
        securityTestHelper.stopTesting()
        invalidateObservableTokens()
    }
}
