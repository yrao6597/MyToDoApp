import SwiftUI

struct DetailedTaskView: View {
    let task: TaskModel
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(task.description)
            Text(task.priority)
        }
    }
}

struct DetailedTaskView_Previews: PreviewProvider {
    static var task1 = TaskModel(title: "First", isCompleted: false, dueDate: Date(), description: "Describe task 1", priority: "Low")
    static var task2 = TaskModel(title: "Second", isCompleted: true, dueDate: Date(), description: "Describe task 2", priority: "High")
    static var previews: some View {
        Group {
            DetailedTaskView(task: task1)
            DetailedTaskView(task: task2)
        }
    }
}
