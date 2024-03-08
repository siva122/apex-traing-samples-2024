trigger OpportunityTrigger on Opportunity (after insert,after update,after delete,after undelete) {
// insert 
//update -accountid amount 
//delete opty record
//undelete -insert 
Set<Id> accIds=new Set<Id>();
if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete)){
   for(Opportunity opty :Trigger.new){
    if(opty.accountid !=null){
        accIds.add(opty.accountid);
    }
   }
}
if(Trigger.isAfter && Trigger.isUpdate){
//opty-acc-test1 -old acc-test2
for(Opportunity opty :Trigger.new){
    if(opty.accountid !=null && 
    opty.accountid !=Trigger.oldMap.get(opty.Id).AccountId){
 accIds.add(opty.accountid);
 accIds.add(Trigger.oldMap.get(opty.Id).AccountId);
    }else{
        accIds.add(opty.AccountId);
    }
}
}

if(Trigger.isAfter && Trigger.isDelete){
  for(Opportunity opty : Trigger.old){
    if(opty.AccountId!=null){
        accIds.add(opty.AccountId);
    }
  }
}
//implement logic
if(!accIds.isEmpty()){
    Map<Id,Account> mapList=new Map<Id,Account>();
    List<AggregateResult> aggList=[select AccountId accId,SUM(Amount) tAmount from Opportunity where AccountId IN :accIds group by AccountId ];
    if(aggList.size()>0){
  for(AggregateResult agg : aggList){
    Account acc=new Account();
    acc.Id=(Id)agg.get('accId');
    acc.OptySumAmount__c=(Decimal)agg.get('tAmount');
    mapList.put(acc.Id,acc);

  }
}else{
    for(Id accId :accIds){
        Account acc=new Account();
        acc.Id=accId;
        acc.OptySumAmount__c=0;
        mapList.put(acc.Id,acc);
    }
}
  if(!mapList.isEmpty()){
  update mapList.values();
  }
}
}