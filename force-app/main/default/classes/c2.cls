public class c2 {
    Account[] slist;
    
    public Account[] getm(){
    return slist;
    }

public PageReference Showlist(){
slist= [Select Name , Type From Account];
return null;

}


public PageReference ShowTypelist(){
slist= [Select Name , Type From Account where Type='Prospect'];
return null; 
}

}