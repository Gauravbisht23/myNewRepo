public with sharing class WrapperIntStringDisplayClass 
 {
// Creating lists for the object opportunity
   List<opportunity> lsttest = new List<opportunity>();
// Creating List for Wrapper class
   public List<wrapper> lstw = new List<wrapper>();
// Get method calling from PageBlockTable and return the list of wrapper to Table
   public List<wrapper> getLstwrapperIntString() {
        lsttest = [select Id, Name from opportunity];
    for(Integer i=0;i<lstw .size();i++){
        lstw.add(new wrapper(lsttest[i].Id,lsttest[i].Name));
}
    return lstw;
}
// Wrapper Class Construction

    public class wrapper{
         public String Id{get;set;}
         public String Name{get;set;}
// Wrapper class constructor
    public wrapper(String Id,String Name ){
        this.Id=Id;
        this.Name=Name;
        }
        
    }
}