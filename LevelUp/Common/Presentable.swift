//
//  ViewModel.swift
//  LevelUp
//
//  Created by Don Vo on 4/12/20.
//  Copyright © 2020 Don Vo. All rights reserved.
//

import UIKit

protocol Presentable {
    associatedtype ViewModel
    var presenter: Any? { get set }
    var viewModel: ViewModel { get set }
}
