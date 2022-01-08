import Foundation

// Struct: immutable (with all of the let statements)
struct TaskModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    let dueDate: Date
    let description: String
    let priority: String

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, dueDate: Date, description: String, priority: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.description = description
        self.priority = priority
    }
    
    func completeSpecificTask() -> TaskModel {
        return TaskModel(id: id, title: title, isCompleted: !isCompleted, dueDate: dueDate, description: description, priority: priority)
    }
    
}

