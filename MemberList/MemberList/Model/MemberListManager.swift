//
//  MemberListManager.swift
//  MemberList
//
//  Created by yona on 12/11/23.
//

import UIKit

class MemberListManager {
    private var memberList: [Member] = []
    
    func initializeMemberList() {
        self.memberList = [
            Member(name: "홍길동", age: 18, phoneNumber: "010-1234-5678", address: "대한민국 서울"),
            Member(name: "임꺽정", age: 37, phoneNumber: "010-9876-5432", address: "대한민국 부산"),
            Member(name: "배트맨", age: 38, phoneNumber: "010-9999-9999", address: "미국 고담"),
            Member(name: "조커", age: 46, phoneNumber: "010-1111-1111", address: "미국 고담"),
            Member(name: "잡스", age: 57, phoneNumber: "010-7777-5555", address: "미국 실리콘벨리"),
            Member(name: "베조스", age: 45, phoneNumber: "010-1235-5432", address: "미국 뉴욕"),
            Member(name: "팀쿡", age: 44, phoneNumber: "010-6666-4444", address: "미국 실리콘벨리"),
        ]
    }
    
    func getMemberList() -> [Member] {
        self.memberList
    }
    
    func insertMember(_ member: Member) {
        self.memberList.append(member)
    }
    
    func updateMember(idx: Int, _ member: Member) {
        self.memberList[idx] = member
    }
    
    subscript(idx: Int) -> Member {
        get {
            self.memberList[idx]
        }
        set {
            self.memberList[idx] = newValue
        }
    }
}
