public with sharing class AccountTypeQuery {

   Public string selectedType{get;set;}
    Public List<SelectOption> AccountType{get;set;}
    Public List<Account> ListOfMatchingTypeAccount{get;set;}
     
    public AccountTypeQuery(ApexPages.StandardController controller) {
        AccountType = new List<SelectOption>();
        AccountType.add(new selectOption('', '- None -'));
        AccountType.add(new selectOption('Prospect', 'Prospect'));
        AccountType.add(new selectOption('Customer', 'Customer'));
    }
    
    public pageReference queryAccount() {
        ListOfMatchingTypeAccount = new List<Account>();
        
          ListOfMatchingTypeAccount = [SELECT Id, Name 
                                       FROM Account 
                                       WHERE Type = :selectedType];
        
        return null;
    }

}