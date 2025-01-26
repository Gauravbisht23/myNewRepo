public with sharing class CaseTriggerHandler {

public static void beforeInsert(List <Case> newCaseList){
    //1.get all the new record email.
    Set<String> contactIdSet = new Set<String>();
    for(Case newCase : newCaseList){
        if(String.isNotBlank(newCase.SuppliedEmail)){
            contactIdSet.add(newCase.SuppliedEmail.toLowerCase());
        }
      
    }
    //2.get all the contact list from emailid.

Map<string,id> mapEmailCon=new Map<string,id>();
for(contact con:[select id,email from Contact where email In :contactIdSet]){
    mapEmailCon.put(con.email.toLowerCase(),con.id);
}
for(Case newCaseAddCon : newCaseList){
if(String.isNotBlank(newCaseAddCon.SuppliedEmail)){
    if(contactIdSet.contains(newCaseAddCon.SuppliedEmail.toLowerCase())){
        newCaseAddCon.contactid=mapEmailCon.get(newCaseAddCon.SuppliedEmail.toLowerCase());
            }
            
}

    //3. populate the contact id in the case record

}

}
}