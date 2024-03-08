// List<Contact> conList = [Select Department , Description from Contact];
// List<Contact> updatedList = new List<Contact>();
// for(Contact badCon : conList) {
    
//         badCon.Description = 'New description';

//     // Not a good practice since governor limits might be hit.
//     updatedList.add(badCon);
// }
// update updatedList;
// // for(Integer i=1;i<=100;i++){
// //     Contact con=new Contact(LastName='sample324'+i,FirstName='sample1223432'+i);
// //     insert con;
// // }

// Account a = new Account(Name = 'xyz');
// insert a; 
// Assert.isNull([SELECT AccountNumber FROM Account WHERE Id  = :a.Id]. AccountNumber);  
// // Create a savepoint while AccountNumber is null 
// Savepoint sp = Database.setSavepoint(); 
// // Change the account number 
// a.AccountNumber = '123'; 
// update a; 
// Savepoint sp1 = Database.setSavepoint(); 

// delete a;
// Database.rollback(sp);
// Assert.areEqual('123', [SELECT AccountNumber FROM Account WHERE Id  = :a.Id]. AccountNumber); 
// // Rollback to the previous null value 

// Assert.isNull([SELECT AccountNumber FROM Account WHERE Id  = :a.Id]. AccountNumber);


// Create the list of sObjects to insert
List<Account> acctList = new List<Account>();
acctList.add(new Account(Name='dml test1',SampleText__c='sample dmltest1'));
acctList.add(new Account(Name='dml test2',SampleText__c='sample dmltest2'));
acctList.add(new Account(Name='dml test22'));
acctList.add(new Account(Name='dml test3',SampleText__c='sample dmltest3'));

List<Database.SaveResult> srList=Database.insert(acctList,false,AccessLevel.USER_MODE);
for(Database.SaveResult srr:srList){
     if (srr.isSuccess()) {
        // Operation was successful, so get the ID of the record that was processed
        System.debug('Successfully inserted account. Account ID: ' + srr.getId());
    }
    else {
        // Operation failed, so get all errors                
        for(Database.Error err : srr.getErrors()) {
            System.debug('The following error has occurred.');                    
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Account fields that affected this error: ' + err.getFields());
        }
    }
}
// DML statement
//insert acctList;