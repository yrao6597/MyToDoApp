import SwiftUI

struct ToDoListView: View {
    // accessing the view model
    @EnvironmentObject var todoListViewModel: ToDoListViewModel

    var body: some View {
        List {
            ForEach(todoListViewModel.tasks) { task in
                RowView(task: task)
                    .onTapGesture {
                        withAnimation(.linear) {
                            todoListViewModel.completeTask(task: task)
                        }
                    }
            }
            .onDelete(perform: todoListViewModel.deleteTask)
        }
        .navigationTitle("My To-Do's 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: NewTaskView())
                            )
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoListView()
        }
        .environmentObject(ToDoListViewModel())
    }
}
