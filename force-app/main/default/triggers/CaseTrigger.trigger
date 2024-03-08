trigger CaseTrigger on Case (after update) {
   if(Trigger.isAfter && Trigger.isUpdate){
    //logic
    List<Task> taskList=new List<Task>();
    for(Case case1:Trigger.new){
        if(case1.Status=='Closed' && 
        case1.Status != Trigger.oldMap.get(case1.Id).Status){
            Task task=new Task();
            task.Description='case is closed';
            task.Subject='sample subject';
            task.WhatId=case1.Id;
            taskList.add(task);       
         }
    }
    if(!taskList.isEmpty()){
        insert taskList;
   }
}
}