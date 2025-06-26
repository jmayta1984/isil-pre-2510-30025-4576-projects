//
//  UIState.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

enum UIState<T: Equatable> : Equatable {
    case idle
    case loading
    case success(T)
    case failure(String)
}

