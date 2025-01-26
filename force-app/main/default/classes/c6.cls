public class c6 {
    
    
    String keyword;
    Account[] acts;
    
    public void setkeyword(String s){
        keyword=s;
        
    }
    
    Public Account[] getkeyword(){
        return acts;
    }
    
    public PageReference Searchtype(){
        acts=[SELECT Name ,Type from Account where Type='keyword'];
        return null;
    } 

}