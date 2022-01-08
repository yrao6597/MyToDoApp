import Foundation

class ToDoListViewModel: ObservableObject {
    // observable through the views
    // cannot use @State in ViewModels, must use @Published
    @Published var tasks: [TaskModel] = []
    let encodingKey: String = "allTasks"

    init() {
        getTask()
    }
    
    func getTask() {
        guard let storedTasks = UserDefaults.standard.data(forKey: encodingKey) else { return }
        let savedItems = try? JSONDecoder().decode([TaskModel].self, from: storedTasks)

        self.tasks = savedItems ?? []
    }
    
    func addTask(title: String, dueDate: Date, description: String, priority: String) {

        let newTask = TaskModel(title: title, isCompleted: false, dueDate: dueDate, description: description, priority: priority)
        tasks.append(newTask)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func completeTask(task: TaskModel) {
        // get index of task in tasks array
        if let i = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[i] = task.completeSpecificTask()
        }
    }
    
    func saveTasks() {
        // always want to calll saveTasks whenever we make changes to the list of tasks
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: encodingKey)
        }
    }
    
}

