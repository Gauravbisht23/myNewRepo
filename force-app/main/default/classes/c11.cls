public with sharing class c11 {

    public c11(ApexPages.StandardController controller) {

    }
    String keyword;
    List<Account> acts;
    
    Public String getg(){
        
        return keyword;
    }
    
    Public List<Account> getacts(){
        
        return acts;
    }
    public void Setg(String s){
        keyword=s;
        
    }
    
    
    public PageReference showlist(){
        acts=[SELECT Name , Type FROM Account WHERE Type =: keyword];
        return null;
        
    }  

}