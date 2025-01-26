public class WizardForContact 
{
 public List<Contact> contacts{get; set;}
 public string contactName{get; set;}   
 public list<contact> listOfCon{get; set;}   
 public string selectedAccountId{get; set;}   
 public WizardForContact(ApexPages.StandardController std)
  {
   //  contacts= new list<contact>(); 
     contacts=[select id, name from contact];
  }
    
 public void getSelected()
   {
        
       // selectedAccountId = ApexPages.currentPage().getParameters().get('accid');
       System.debug('Entered account selection block '+selectedAccountId);
       // contacts = new List<Contact>();
      // return null;
    } 
  public PageReference wiz2()
  {
     listOfCon= new list<contact>(); 
     listOfCon=[select name,Phone from contact where id = :selectedAccountId];
    // return null;
     return Page.Wizard2; 
  }
    
  public pageReference save()
  {
      list <contact> newList= new list<contact>();
      for(Contact ct : listOfCon)
      {
          contactName=ct.name;
          newList.add(new contact(id=selectedAccountId, Phone=ct.Phone));
      }
      update newList;
    //  return null;
   return Page.Wizard3;  
  }
    
}