import SwiftUI

@main
struct MyToDoListApp: App {
    @StateObject var todoListViewModel: ToDoListViewModel = ToDoListViewModel()
    // want all views to have access to todoListViewModel
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ToDoListView()
            }
            .environmentObject(todoListViewModel)
        }
    }
}

