//
//  RentViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class RentViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testRentView() {
        let book = Book(id: UUID(), title: "Title", author: "Author", image: "", year: 2021, genre: .novel)
        let viewModel = RentViewModel(book: book)
        let view = RentView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
