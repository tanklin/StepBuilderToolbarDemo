//
//  AccountMemorizerBuilder.swift
//  StepBuilderToolbarDemo
//
//  Created by Tank Lin on 2019/1/23.
//  Copyright © 2019 Tank Lin. All rights reserved.
//

/**
 *  Builder Design Pattern:
 *  Using Protocl to limit and comfirm each step.
 */

// MARK: - Impletment Builder
class AccountMemorizerBuilder {
    
    private var model: AccountMemorizerModel!
    
    static var builder: StartStep {
        return AccountMemorizerBuilder(
            AccountMemorizerModel(
                title: "",
                isMemorized: false
            )
        ) as StartStep
    }
    
    private init(_ model: AccountMemorizerModel) {
        self.model = model
    }
    
}

// MARK: - Confirm Protocol
extension AccountMemorizerBuilder: StartStep, MemorizeStep, BuildSetp {
    
    func title(_ title: String) -> MemorizeStep {
        model.title = title
        return self as MemorizeStep
    }
    
    func isMemorized(_ isMemorized: Bool) -> BuildSetp {
        model.isMemorized = isMemorized
        return self as BuildSetp
    }
    
    func build() -> AccountMemorizerToolbar {
        let toolbar = AccountMemorizerToolbar()
        toolbar.title = model.title
        toolbar.isMemorized = model.isMemorized
        return toolbar
    }
}
