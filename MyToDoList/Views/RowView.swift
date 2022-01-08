import SwiftUI

struct RowView: View {
    
    let task: TaskModel
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle": "circle")
            VStack(alignment: .leading, spacing: 5) {
                Text(task.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Due: \(displayDate(date: task.dueDate))")
                    .font(.subheadline)
                    .foregroundColor(dueDateColor(date: task.dueDate))
                Text("Priority: \(task.priority)")
                    .font(.subheadline)
                    .foregroundColor(getPriorityColor(priority: task.priority))
            }
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
    
    func getPriorityColor(priority: String) -> Color {
        if priority == "High" {
            return Color.red
        } else {
            return Color.gray
        }
    }
    
    func displayDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM y"
        return formatter.string(from: date)
    }
    
    func dueDateColor(date: Date) -> Color {
        if date <= Date() {
            return Color.red
        } else {
            return Color.black
        }
    }
}

struct RowView_Previews: PreviewProvider {

    static var task1 = TaskModel(title: "First", isCompleted: false, dueDate: Date(), description: "Describe task 1", priority: "Low")
    static var task2 = TaskModel(title: "Second", isCompleted: true, dueDate: Date(), description: "Describe task 2", priority: "High")
    static var previews: some View {
        Group {
            RowView(task: task1)
            RowView(task: task2)
        }
        .previewLayout(.sizeThatFits)
    }
}
