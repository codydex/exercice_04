part of exercice_04;


class TacheModel extends ConceptModel{
  
  static final String task = 'task';

  Map<String, ConceptEntities> newEntries() {
    var tasks = new Tasks();
    var map = new Map<String, ConceptEntities>();
    map[task] = tasks;
    return map;
}
  
  Tasks get tasks => getEntry(task);
  
  init()
  {
    var to_do = new Task();
    to_do.name = 'Read chapter 4, Sio 6014';
    to_do.state = 'Finished';
    to_do.number = 1;
    to_do.description='This task takes at least 2 hours';
   
    tasks.add(to_do);
    
    var project = new Task();
    project.name = 'Brainstorming for the final project';
    project.state = 'Started';
    project.number = 2;
    project.description='put ideas on Dropbox';
   
    tasks.add(project);
    
    
  }
  
  display()
  {
    print('Task Model');
    print('=============');
    tasks.display('Tasks');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }
  
}