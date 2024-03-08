trigger ContactTrigger on Contact (after update) {


    // on object-contact
    //event -> after -update
    //context variable -> Trigger.new Trgger.oldMap
    if(Trigger.isAfter && Trigger.isUpdate){
        //logic
    Set<Id> accIds=new Set<Id>();
    List<Account> updAccList=new List<Account>();
        for(Contact contact : Trigger.new){
            if(contact.Phone!=null 
            && contact.Phone!=Trigger.oldMap.get(contact.Id).Phone){
                accIds.add(contact.AccountId);
            }
        }

       // Map<Id,Account> accMap=new Map<Id,Account>([select Id,Phone from Account where Id IN:accIds]);
      //List<Account> accList=[select Id,Phone from Account where Id IN:accIds];
      for(Contact contact : Trigger.new){
        
       Account acc=new Account(Id=contact.AccountId,Phone=contact.Phone);
       updAccList.add(acc);
    //    Account acc=accMap.get(contact.AccountId);
    //    acc.Phone=contact.Phone;
    //    updAccList.add(acc);
      }  
      if(!updAccList.isEmpty()){
        update updAccList;
      }
    }
    // conid=003123-phone-12345-phone new 45456 --accid-add-00145353
    //conid=003124    accid-add001456456

    // map<00145353,accrecord>
    // map<001456456,accrecord>

}