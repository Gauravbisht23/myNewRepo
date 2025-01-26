public with sharing class RecordSelectionPaginationController{ 
     
     public List<cOpportunity> lstOpp{get; set;} 
     public boolean yo {get; set;}
    public boolean yo1 {get; set;}
   // Map stores all the records queried as per the pagenumber   
   Map<integer,List<cOpportunity>> mapOpportunityPages = new Map<integer,List<cOpportunity>>();   
   // Pagenumber  
   public integer intPageNumber{get;set;}  
   // total number of pages  
   public integer intNumberofPages{get;set;}  
   // returns the data to be displayed on the page  
   
   // Controller  
   public RecordSelectionPaginationController(ApexPages.StandardController controller) {
       yo=false;
       yo1=false;
   }  
    public Void LstOppRecords1(){
      yo=true;  
        yo1=false;
        LstOppRecords();
    }
    public Void LstOppRecords(){  
       
      lstOpp= new List<cOpportunity>();  
     lstOpp.addAll(mapOpportunityPages.get(intPageNumber));  
    // return lstOpp;  
   }  
     public Void LstOppRecord1(){
      yo1=true;  
         yo=False;
         
        LstOppRecord();
    }
     public Void LstOppRecord(){  
       
      lstOpp= new List<cOpportunity>();  
     lstOpp.addAll(mapOpportunityPages.get(intPageNumber));  
    // return lstOpp;  
   }  
   // sets the pagination data  
   public Pagereference setPagination() {  
     integer NumberofRecords = 0;  
     integer pagenumber = 1;  
     // Looping through the records of Opportunity  
     for (Opportunity objOpp :[SELECT Id,Name,StageName,Account.Name FROM Opportunity LIMIT 10000]) {  
       if (NumberofRecords < 20) {  
         if (mapOpportunityPages.containsKey(pagenumber)){  
           mapOpportunityPages.get(pagenumber).add(new cOpportunity(objOpp,false));  
         }  
         else {  
           mapOpportunityPages.put(pagenumber,new List<cOpportunity>{new cOpportunity(objOpp,false)});  
         }  
         NumberofRecords++;  
         if (NumberofRecords == 20) {  
           NumberofRecords = 0;  
           pagenumber++;  
         }  
       }  
     }  
     intNumberofPages = mapOpportunityPages.size();  
     intPageNumber =1;  
    LstOppRecords();
       
     return null;  
   }  
    
     public Pagereference setPagination1() {  
     integer NumberofRecords = 0;  
     integer pagenumber = 1;  
     // Looping through the records of Opportunity  
     for (Opportunity objOpp :[SELECT Id,Name,Account.Name FROM Opportunity LIMIT 10000]) {  
       if (NumberofRecords < 10) {  
         if (mapOpportunityPages.containsKey(pagenumber)){  
           mapOpportunityPages.get(pagenumber).add(new cOpportunity(objOpp,false));  
         }  
         else {  
           mapOpportunityPages.put(pagenumber,new List<cOpportunity>{new cOpportunity(objOpp,false)});  
         }  
         NumberofRecords++;  
         if (NumberofRecords == 10) {  
           NumberofRecords = 0;  
           pagenumber++;  
         }  
       }  
     }  
     intNumberofPages = mapOpportunityPages.size();  
     intPageNumber =1;  
    
         LstOppRecord();
     return null;  
   }  
    
   public Boolean hasNext {  
     get {  
       if (intNumberofPages <= intPageNumber) {  
         return false;  
       }  
       else {  
         return true;  
       }  
     }  
     set;  
   }  
   public Boolean hasPrevious {  
     get {  
       if (intPageNumber == 1) {  
         return false;  
       }  
       else {  
         return true;  
       }  
     }  
     set;  
   }  
   public void first() {  
      intPageNumber = 1;  
    LstOppRecords();
       LstOppRecord();
   }  
   public void last() {  
      intPageNumber=intNumberofPages;   
   LstOppRecords();
       LstOppRecord();
   }   
   public void previous() {  
      intPageNumber--;  
    LstOppRecords();
       LstOppRecord();
   }  
    public void next() {  
      intPageNumber++;  
   LstOppRecords();
        LstOppRecord();
    }  
   // Wrapper to wrap the Checkbox value and Objrecord together  
   public class cOpportunity {  
     public Opportunity objOpp{get;set;}  
     public Boolean Selected{get;set;}   
     public cOpportunity(Opportunity objOpp,Boolean bSel) {  
       this.objOpp = objOpp;  
       this.Selected = bSel;  
     }   
   }  
 }