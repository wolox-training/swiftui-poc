//
//  LibraryView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct LibraryView: View {

    private struct Constants {
        static let scrollViewTopPadding: CGFloat = 32
        static let scrollViewBottomPadding: CGFloat = 5
        static let scrollViewHorizontalPadding: CGFloat = 20 
    }
    
    private var viewModel: LibraryViewModel
    
    init(viewModel: LibraryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LibraryList(viewModel: viewModel)
                .padding(EdgeInsets(top: Constants.scrollViewTopPadding,
                                leading: Constants.scrollViewHorizontalPadding,
                                bottom: Constants.scrollViewBottomPadding,
                                trailing: Constants.scrollViewHorizontalPadding))
        }
        .background(WBooksColors.backgroundColor)
        .navigationBarTitle("LibrayView.navigationView.title")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            LibraryToolbar()
        }
    }
}

/// List of books
private struct LibraryList: View {
    
    private struct Constants {
        static let cellSpacing: CGFloat = 15
    }
    
    @ObservedObject private var viewModel: LibraryViewModel
    
    init(viewModel: LibraryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        LazyVStack(spacing: Constants.cellSpacing) {
            ForEach(viewModel.cellModels) { cellModel in
                NavigationLink(
                    destination: BookDetailView(viewModel: cellModel.createBookDetailViewModel()),
                    label: {
                        LibraryCell(viewModel: cellModel)
                    })
                    .frame(height: LibraryCell.height)
            }
        }
        .modifier(ProgressViewModifier(show: viewModel.showProgressView))
        .onAppear(perform: onLoad)
    }
    
    private func onLoad() {
        viewModel.fetchBooks()
    }
}

/// Buttons for the navigation bar.
private struct LibraryToolbar: ToolbarContent {
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                print("Alert")
            }, label: {
                WBooksImages.notifications
                    .renderingMode(.template)
            })
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                print("Search")
            }, label: {
                WBooksImages.search
                    .renderingMode(.template)
            })
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    
    static var viewModel: LibraryViewModel {
        return LibraryViewModel()
    }
    
    static var previews: some View {
        NavigationView{
            LibraryView(viewModel: viewModel)
        }
    }
}
