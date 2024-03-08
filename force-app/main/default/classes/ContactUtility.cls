public with sharing class ContactUtility {
    public static List<Contact> getContactsByEmail(String email){
        if(!String.isEmpty(email)){
            return [SELECT Id, Name, Email FROM Contact WHERE Email = :email];
        }
        return null;
    }
}