public class selectCheckboxController {

 
 List<SelectOption> options {get;set;}
 public String type {get;set;}
 public List<wrapperClass> accList{get;set;}
 public List<wrapperClass> selectedAccount {set;get;}
 
 public List<SelectOption> getSelectType(){
  List<SelectOption> options = new List<SelectOption>();
  Schema.DescribeFieldResult accType= Account.Type.getDescribe();
 
  options.add(new SelectOption('--Select Account Type--','--Select Account Type--'));
  for(Schema.PicklistEntry pickList : accType.getPicklistValues()){
  
  options.add(new SelectOption(pickList.getLabel(), pickList.getValue()));
  
  }
  return options;
  }
 
 
 public PageReference getAccounts(){
 accList = new List<wrapperClass>();
 for(Account a: [SELECT Id,Name, Type, Phone FROM Account WHERE Type=:type]){
     accList.add(new wrapperClass(a));
 }
 
 return null;
 }
 
 public PageReference getSelected(){
 selectedAccount = new  List<wrapperClass>();
    
     for(wrapperClass accWrapp: accList){
         if(accWrapp.selected == true){
             selectedAccount.add(accWrapp);
             }
          
     }
      
     return null;
 }
 
 
 public class wrapperClass{
 
 public Account acc {get;set;}
 public Boolean selected {get;set;}
 wrapperClass(Account a){
 acc = a;
 selected=false;
 
 }
 }
}