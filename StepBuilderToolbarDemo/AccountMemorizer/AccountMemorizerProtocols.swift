//
//  AccountMemorizerProtocols.swift
//  StepBuilderToolbarDemo
//
//  Created by Tank Lin on 2019/1/23.
//  Copyright © 2019 Tank Lin. All rights reserved.
//

/**
 *  Builder Design Pattern:
 *  Using Protocl to limit and comfirm each step.
 */
// MARK: - Protocols
protocol StartStep {
    func title(_ title: String) -> MemorizeStep
}

protocol MemorizeStep {
    func isMemorized(_ isMemorized: Bool) -> BuildSetp
}

protocol BuildSetp {
    func build() -> AccountMemorizerToolbar
}
