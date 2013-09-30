part of exercice_04;

class Task extends ConceptEntity<Task>
{
  String _name;
  String state;
  String description;
  num number;
  
  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = name;
    }
  
}
  
  Task newEntity() => 
      new Task();
  
  Task copy() {
    var task = super.copy();
    task.name = name;
    task.state = state;
    task.number = number;
    task.description = description;
    return task;
  }

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    name: ${name}, \n '
           '    state: ${state}\n'
           '    number: ${number}\n'
           '  }';
  }
  
 
  
 bool get Started =>
      state.contains('Started') ? true : false;

bool get Finished =>
    state.contains('Finished') ? true : false;

int getNumero() => 
    (this.number);

}

class Tasks extends ConceptEntities<Task> {
  Tasks newEntities() => new Tasks();
  Task newEntity() => new Task();
}