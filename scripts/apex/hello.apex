// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

//  account-contact-lookup

//account-update the phone on account
//contacts- upadate with account phonenumber
// trigger on Account
//before/after-> after-> after update cond->oldphone!=newphone
//oldphone->oldmap 
//newphone->new
10/0
logic erros
    //10+3/5
    //(10+3)/5

List<Account> acctsList = [SELECT Id, Name, BillingCity
                        FROM Account WHERE BillingCity = 'San Francisco'];
for (Account a : acctsList) {
    a.BillingCity = 'Mumbai';
    a.SampleText__c='sampletext';
}
Account newAcct = new Account(Name = 'Acmenewacc12', BillingCity = 'San Francisco',SampleText__c='sampletext3432');
acctsList.add(newAcct);
try {
    upsert acctsList;
} catch (DmlException e) {
  System.debug(e.getDmlFieldNames());
}