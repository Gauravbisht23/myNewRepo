public with sharing class WrapperClassTrial {

public list <contactCheckBoxWrapper> listOfBooConAcc{get;set;}

public WrapperClassTrial() {

listOfBooConAcc = new list<contactCheckBoxWrapper> ();

for(contact c : [SELECT Id, Name, AccountId, Account.Name, LastName 
                 FROM Contact 
                 WHERE AccountId != Null LIMIT 10]) {
    
    listOfBooConAcc.add(new contactCheckBoxWrapper(false,c,c.Account.Name));
                 
 }


}

public class contactCheckBoxWrapper {

public boolean check{get;set;}
public contact con{get;set;}
public string acc {get;set;}

    public contactCheckBoxWrapper(boolean check, contact con , string acc) {
    
        this.check = check;
        this.con = con;
        this.acc = acc;
    
    }
}


}