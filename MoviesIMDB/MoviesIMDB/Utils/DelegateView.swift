//
//  DelegateView.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import Foundation

class DelegateView<Input> {
    private(set) var accept: ((Input) -> Void)?
    
    func subscribe<Context: AnyObject>(to context: Context, with onNext: @escaping (Context, Input) -> Void) {
        self.accept = { [weak context] input in
            guard let object = context else {
                return
            }
            onNext(object, input)
        }
    }
}
