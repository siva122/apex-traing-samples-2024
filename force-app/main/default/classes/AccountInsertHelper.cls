public class AccountInsertHelper {
    public static void insertAccount(List<Account> accList){
       
        for(Account account :accList){
            if(account.Industry=='Education'){
                account.Description='sample education description';
              
                
            }
        }
        
    }
  
}