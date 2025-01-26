public class ctrlAccController {


  
    
    
    
    public list<account> showList = new list<account>([select Id, Name, Type from Account where type in ('Prospect','Customer - Direct')]);
    
    

    
    
    Public list<account> getshowList(){
        
        return showList;
    }
}