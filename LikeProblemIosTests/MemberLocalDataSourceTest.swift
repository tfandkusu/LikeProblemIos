//
//  MemberLocalDataSourceTest.swift
//  LikeProblemIosTests
//
//  Created by toya on 2023/12/17.
//

@testable import LikeProblemIos
import XCTest

final class MemberLocalDataSourceTest: XCTestCase {
    private let localDataSource = MemberLocalDataSource()

    func test() async {
        let memberList = [
            Member(division: "Develop", name: "A"),
            Member(division: "Admin", name: "B"),
            Member(division: "Sales", name: "C"),
        ]
        var index = 0
        for try await value in localDataSource.getMembersAsAsyncStream() {
            if index == 0 {
                index += 1
                XCTAssertEqual([], value)
                localDataSource.setMembers(newValue: memberList)
            } else {
                XCTAssertEqual(memberList, value)
                break
            }
        }
    }
}
