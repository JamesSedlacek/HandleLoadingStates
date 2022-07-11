//
//  NetworkingService.swift
//  HandleLoadingStates
//
//  Created by James Sedlacek on 7/7/22.
//

import Foundation

enum NetworkError: Error {
    case asyncFailure
}

struct NetworkingService {
    static func mockAPIcall(seconds: Double) async throws -> [Item] {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
        return [Item(id: "0", title: "one"),
                Item(id: "1", title: "two"),
                Item(id: "2", title: "three")]
    }
    
    static func mockAPIcallFailure(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
        throw NetworkError.asyncFailure
    }
}
