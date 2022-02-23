//
//  핸드폰 번호 가리기.swift
//  
//
//  Created by chihoooon on 2022/02/23.
//

import Foundation

func solution(_ phoneNumber: String) -> String {
    let length = phoneNumber.count
    return String(repeating: "*", count: length - 4) + phoneNumber.suffix(4)
}
