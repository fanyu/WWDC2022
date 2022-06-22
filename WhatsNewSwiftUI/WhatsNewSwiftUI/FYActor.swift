//
//  FYActor.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/12.
//

import Foundation

struct FileStatus {
    let url: String
    var progress: Double
}

actor ParallelCompressor {
    
    unowned let status: CompressionState
    
    init(status: CompressionState) {
        self.status = status
    }
    
    nonisolated func compressFile(url: String) async -> Data {
        print("compress url \(url)")
        Task { @MainActor in // 执行之后，切回主线程进行更新
            status.updateProgress(url:url, progress:9)
        }
        return Data()
    }

    
}

@MainActor
class CompressionState: ObservableObject {
    
    @Published var files: [FileStatus] = []
    var compressor: ParallelCompressor! // 耗时操作，放到一个独立的actor中并发执行
    
    init() {
        compressor = ParallelCompressor(status: self)
    }
    
    func updateProgress(url: String, progress: Double) {
        if let loc = files.firstIndex(where: { $0.url == url }) {
            files[loc].progress = progress
        }
    }
    
    func compressAllFiles() {
        for file in files {
            Task.detached { // 不继承上下文，并发执行
                await self.compressor.compressFile(url: file.url) // 耗时操作
            }
        }
    }
    
}
