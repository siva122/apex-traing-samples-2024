trigger AccountTrigger on Account (before delete) {
if(Trigger.isDelete && TRigger.isBefore){
Set<Id> accIds =new Set<Id>();
    for(Account acc: Trigger.old){
    accIds.add(acc.id);
    }
}
if(!accIds.isEmpty){

    Map<Id,Account>   accMap=new Map<Id,Account>([select Id,Name,(select Id,AccountId from Contacts) from Account where Id IN: accIds]);

for(Account acc: Trigger.old){
    Account acc=accMap.get(acc.id);
    Integer contactsSize=acc.contacts.size();
    if(contactsSize>3){
        acc.addError('you cant delete the account because it is having more than three contacts');
    }

}

}
}