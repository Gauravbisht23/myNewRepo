public with sharing class AccountTriggerHandler {

public static void beforeInsert(List <Account> accList) {

    for (Account acc:accList) {
        if(acc.AnnualRevenue == null || acc.AnnualRevenue <1000000){
            acc.Rating='Cold';
        }
        else if (acc.AnnualRevenue >= 1000000 && acc.AnnualRevenue <2000000){
            acc.Rating='Warm';
        }
        else if(acc.AnnualRevenue >= 2000000 ){
            acc.Rating='Hot';
        }
        }
    

   
        for(Account aObj :accList){
            //We should first check whether the user is passing null data
            if(aObj.BillingStreet!=null){
            aObj.ShippingStreet=aObj.BillingStreet;
            }
            if(aObj.BillingCity!=null){
            aObj.ShippingCity=aObj.BillingCity;
            }
            if(aObj.BillingState!=null){
            aObj.ShippingState=aObj.BillingState;
            }
            if(aObj.BillingPostalCode!=null){
            aObj.ShippingPostalCode=aObj.BillingPostalCode;
            }
            if(aObj.BillingCountry!=null){
            aObj.ShippingCountry=aObj.BillingCountry;
            }
            }
     
  }

public static void accConPhoneMatch(List<Account> newAccountList, Map<Id,Account> oldAccountMap){

 /*   Set<account> uniAcc= new Set<account>();
    Map<id, List<Contact>> AccConMap = new Map<id, List<Contact>>();
    List<contact> allContacts= new List<contact>();
List<contact> updateContacts= new List<contact>();

    for(account a:[SELECT id, phone, name, (SELECT id, name, accountid, phone FROM CONTACTS)FROM Account WHERE id in:acclist.keyset()]){
        uniAcc.add(a);
        List<contact> con= a.contacts;
           if(a.phone != oldMap.get(a.id).phone){
              uniAcc.add(a);
             AccConMap.put(a.id,con);

            }
        }
       
 
    if(!AccConMap.isEmpty())    {
for(List<contact> aCon:AccConMap.values()){
    allContacts.addAll(aCon);
}

for(contact uCon:allContacts){
    if(String.isBlank(uCon.phone) || ucon.phone ==oldMap.get(ucon.accountid).phone ){
//contact upContact=new contact();
//ucon.id=ucon.id;
ucon.phone=acclist.get(ucon.accountid).phone;
updateContacts.add(ucon);
    }
}
}
update updateContacts;  */

Map<Id, String> accountIdPhoneMap= new Map<Id, String>();
List<Contact> updatedConlist = new List<Contact>();

 for(Account acc: newAccountList){
    String newPhoneNumber=acc.phone;
    Account oldAccount= oldAccountMap.get(acc.Id);
    String oldPhoneNumber= oldAccount.phone;
    if(newPhoneNumber != oldPhoneNumber){
        accountIdPhoneMap.put(acc.Id,oldPhoneNumber);
    } 
 }

 if(!accountIdPhoneMap.isEmpty()){
   for(Account acc : [SELECT id, phone,(SELECT id, phone FROM contacts) FROM Account WHERE id in :accountIdPhoneMap.keySet()]){
      String newAccPhoneNumber = acc.Phone;
      String oldPhoneNumber = accountIdPhoneMap.get(acc.id);
     for(Contact con : acc.Contacts){
if(String.isBlank(con.Phone) || con.phone == oldPhoneNumber){
 con.phone=newAccPhoneNumber;
 updatedConlist.add(con);
     }
   }
}
if(!updatedConlist.isEmpty()){
update updatedConlist;
}
}



}

}