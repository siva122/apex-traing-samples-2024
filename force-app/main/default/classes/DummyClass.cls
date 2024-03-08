public with sharing class DummyClass {
    public static void listAccount(){
        //List<Account> listAcc =[SELECT Id,Name,Rating,Industry,(Select Id,FirstName,LastName FROM Contacts) FROM Account WHERE Id='0012v00002ab7dAAAQ'];
        List<Account> listAcc = [SELECT id,Name,Rating FROM Account];
		System.debug('List of Account :'+listAcc);
    }
}