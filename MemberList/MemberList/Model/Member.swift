//
//  Member.swift
//  MemberList
//
//  Created by yona on 12/11/23.
//

import UIKit

protocol MemberDelegate: AnyObject {
    func insertMember(_ member: Member)
    func updateMember(idx: Int, _ member: Member)
}

struct Member {
    static var mememberCount: Int = 0
    
    var memberID: Int
    var name: String?
    var age: Int?
    var phoneNumber: String?
    var address: String?
    
    lazy var memberImage: UIImage? = {
        guard let name = self.name else {
            return UIImage(named: "person")
        }
        return UIImage(named: "\(name).png") ?? UIImage(named: "person")
    }()
    
    init(name: String?, age: Int?, phoneNumber: String?, address: String?) {
        self.memberID = Member.mememberCount
        Member.mememberCount += 1
        
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
        self.address = address
    }
}
