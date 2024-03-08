
// String name='Edge Communications';
// // String str='select Id,Name from Account where Name= \''+name+'\'';
// //   List<Account> accLists=Database.query(str);
// //   System.debug('accsize:'+accLists.size());
// // soql injection attacks
// //url name  name OR Name!='Test Account'
// //bind variables
// String str1='select Id,Name from Account where Name=:name';
//   List<Account> accLists1=Database.query(str1);
//   System.debug('accsize1:'+accLists1.size());
//   String rating='Hot';
//   String type='Customer - Direct';
//  //Map<String,Object> bindMap=new Map<String,Object>{'rating'=>rating,'type'=>type};
//   Map<String,Object> bindMap=new Map<String,Object>();
// bindMap.put('rating1','Hot');
// bindMap.put('type1','Customer - Direct');

// String str2='select Id,Name from Account where  Rating=:rating1 and Type=:type1';
//    List<Account> accListMaps=Database.queryWithBinds(str2,bindMap,AccessLevel.USER_MODE);
//   System.debug('accsize bindmap:'+accListMaps.size());
Account a = new Account(Name = 'xyzroolbacktest12',SampleText__c='sample dmltest1');
insert a; 

// Create a savepoint while AccountNumber is null 
Savepoint sp1 = Database.setSavepoint(); 
// Change the account number 
a.AccountNumber = '123'; 
update a; 
Savepoint sp2 = Database.setSavepoint(); 

a.Rating='Hot';
update a;
Savepoint sp3 = Database.setSavepoint(); 

delete a;
Savepoint sp4 = Database.setSavepoint(); 
 Database.rollback(sp3);
