public class parm {
    public id idrec{set;get;}
    public string firstName{set; get;}
    public string LastName{set; get;}
    public string Phone{set; get;}
    public list<Contact> rec{set; get;}
    public parm(){
       rec=[Select name, phone from contact ]; 
    }
    
    public void editbtn(){
        list<contact> con = [Select firstname , lastname , phone from contact where id =:idrec];
        firstName=con[0].firstname;
        LastName=con[0].Lastname;
        phone=con[0].phone;
    }
    
    public PageReference deletebtn(){
        list<contact> c= [Select id from contact where id =:idrec];
        delete c;
        
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
pageRef.setRedirect(true);
return pageRef;
        
    }
    public PageReference savebtn()
    {
        
     contact c= new contact();
        c.id=idrec;
        c.Firstname= firstName;
        c.lastname= LastName;
        c.Phone= phone;
        update c;
        
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
pageRef.setRedirect(true);
return pageRef;
        
    }

}