//
//  TodoListView.swift
//  SwiftUICombineBase
//
//  Created by user on 4/30/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                Text(todo.title)
            }
            .navigationBarTitle(Text("Todo List"))
        }
        .onAppear {
            self.viewModel.fetchTodos()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        var view = TodoListView()
        view.viewModel = TodoListViewModel(dataManager: MockDataManager())
        return view
    }
}
