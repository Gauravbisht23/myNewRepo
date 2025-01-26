@RestResource(urlMapping = '/showAccountsDetail/*')
global with sharing class checkAccount {
    
    @HttpGet
    
    global static list<Account> getAccount(){
        list<Account> lst;
        try{
            lst=[SELECT id , Name, phone From Account];
            return lst;
        }
        catch(Exception ex) {
            system.debug('Error'+ ex.getMessage());
            
        }
        return lst;
    }

}