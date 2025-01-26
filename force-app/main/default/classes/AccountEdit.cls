public class AccountEdit {
  
    public list<Contact> record{get;set;}
    public id idofRec{get;set;}
    public string nameofrec{set;get;}
    public string phoneofrec{set;get;}
    public AccountEdit()
    {
        record = new list<contact>();
        record =[select id,name,phone from contact where phone != NULL ORDER BY name DESC];
        
    }
    public void valueofrec()
    {
        list<contact> conrec = [select name,phone from contact where id =: idofRec];
        nameofrec =conrec[0].name;
        phoneofrec = conrec[0].phone;
        
    }
    public PageReference savebtn()
    {
        
     contact c= new contact();
        c.id=idofRec;
        c.lastname= nameofrec;
        c.Phone= phoneofrec;
        update c;
        
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
pageRef.setRedirect(true);
return pageRef;
        
    }

}