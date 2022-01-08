import SwiftUI

struct NewTaskView: View {
    @EnvironmentObject var todoListViewModel: ToDoListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @State var description: String = ""
    @State var due: Date = Date()
    @State var alertMsg: String = ""
    @State var showAlertMsg: Bool = false
    @State var priority: String = "Low" // default value
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title", text: $textFieldText)
                    .padding(.leading, 20.0)
                    .frame(height: 45.0)
                    .background(Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 0.3116170805)))
                    .cornerRadius(15.0)
                Spacer()
                    .frame(height: 20.0)
                VStack(alignment: .leading) {
                    Text("Description")
                        .padding(.leading, 10)
                    Spacer()
                        .frame(height: 20.0)
                    TextEditor(text: $description)
                        .frame(width: 375.0, height: 120.0, alignment: .center)
                        .background(Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 0.3116170805)))
                        .cornerRadius(15.0)
                        .shadow(color: .gray, radius: 2, x: 1, y: 1)
                }
                Spacer()
                    .frame(height: 30.0)
                DatePicker("Due Date", selection: $due, displayedComponents: .date)
                    .padding(.leading, 10)
                Spacer()
                    .frame(height: 25.0)
                Picker(selection: $priority,
                label:
                    Text("Priority")
                    .font(.headline)
                    .cornerRadius(15)
                    .frame(height: 40.0)
                    .padding(.horizontal)
                       , content: {
                    Text("Low").tag("Low")
                    Text("Medium").tag("Medium")
                    Text("High").tag("High")
                })
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
                    .frame(height: 30.0)
                Button(action: addNew, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(15.0)
                })
            }
            .padding(15)
        }.navigationTitle("Create New Task")
        .alert(isPresented: $showAlertMsg, content:
            getAlert
        )
    }
    
    func addNew() {
        if due < Date() {
            alertMsg = "The due date of this task must be a future date."
            showAlertMsg.toggle()
        } else {
            // go back to the previous page immediately
            todoListViewModel.addTask(title: textFieldText, dueDate: due, description: description, priority: priority)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMsg))
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewTaskView()
        }
        .environmentObject(ToDoListViewModel())
    }
}
