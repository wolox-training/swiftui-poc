//
//  AddNewView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct AddNewView: View {
    
    private struct Constants {
        static let formTopPadding: CGFloat = 32
        static let formBottomPadding: CGFloat = 20
        static let formHorizontalPadding: CGFloat = 20
    }
    
    private let viewModel: AddNewViewModel
    
    init(viewModel: AddNewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        FormView(viewModel: viewModel)
            .padding(EdgeInsets(top: Constants.formTopPadding,
                                leading: Constants.formHorizontalPadding,
                                bottom: Constants.formBottomPadding,
                                trailing: Constants.formHorizontalPadding))
            .navigationBarTitle("AddNewView.navigationView.title")
            .navigationBarTitleDisplayMode(.inline)
    }
}

private struct FormView: View {
    
    private struct Constants {
        static let formTopPadding: CGFloat = 32
        static let formBottomPadding: CGFloat = 20
        static let formHorizontalPadding: CGFloat = 20
    }
    
    @ObservedObject private var viewModel: AddNewViewModel
    
    init(viewModel: AddNewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            Section(header: Text("AddNewView.form.header")) {
                TextField("AddNewView.form.title", text: $viewModel.title)
                TextField("AddNewView.form.author", text: $viewModel.author)
                TextField("AddNewView.form.image", text: $viewModel.image)
                TextField("AddNewView.form.year", text: $viewModel.year)
                    .keyboardType(.numberPad)
                Picker("AddNewView.form.genre", selection: $viewModel.genre) {
                    ForEach(Genre.allCases, id: \.self) {
                        Text(String($0.description))
                    }
                }
            }
            
            Button(action: {
                viewModel.submit()
            }, label: {
                Text("AddNewView.form.submit")
            })
        }
    }
    
}


struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewView(viewModel: AddNewViewModel())
        }
    }
}
