public class WrapperClass {
    public list<Account> Acco {set; get;}
   //List<Account> Acc= new List<Account>();
 public List<Account>  Acc =[SELECT Name FROM Account];
public List<selectoption>  a = new List<SelectOption>();
    public WrapperClass(){
       for(Account ac: acc){
        
    } 
    }
    
    
    
    /*for(Account ac : acc)
    {
        //Selectoption s= new selectoption(ac,ac);
      //  a.add(s);
    }*/

}