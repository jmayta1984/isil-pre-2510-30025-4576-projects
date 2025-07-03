//
//  UIState.swift
//  FoodLab
//
//  Created by user272495 on 7/2/25.
//

enum UIState<T> {
    case initialState
    case loadingState
    case successState(T)
    case failureState(String)
}
