//
//  ToastManager.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import Foundation

struct ToastManager {
    var isShowingSuccessToast = false
    var successToastMessage = ""
    var isShowingErrorToast = false
    var errorToastMessage = ""
    var isShowingLoadingToast = false
    var loadingToastMessage = ""
}

extension ToastManager {
    mutating func showSuccessToast(withMessage message: String) {
        isShowingLoadingToast = false
        successToastMessage = message
    }
    
    mutating func showSucces() {
        isShowingSuccessToast.toggle()
    }
    
    mutating func showErrorToast(withMessage message: String) {
        isShowingLoadingToast = false
        errorToastMessage = message
    }
    
    mutating func showError() {
        isShowingErrorToast.toggle()
    }
    
    mutating func showLoadingToast() {
        isShowingLoadingToast = true
    }
    
    mutating func hideLoadingToast() {
        isShowingLoadingToast = false
    }
}
