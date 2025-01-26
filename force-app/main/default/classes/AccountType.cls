public with sharing class AccountType {


   Public string selectedType{get;set;}
    Public List<SelectOption> AccountTypes{get;set;}
    Public List<Account> ListOfMatchingTypeAccount{get;set;}
     
    
  public AccountType(ApexPages.StandardController controller) {
        
        
        
        
    }
    
    public void queryAccount() {
        ListOfMatchingTypeAccount = new List<Account>();
        
          ListOfMatchingTypeAccount = [SELECT Id, Name , Phone
                                       FROM Account 
                                       WHERE Type = :selectedType];
        
       
    }

}