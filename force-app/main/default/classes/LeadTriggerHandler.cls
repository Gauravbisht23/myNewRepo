public with sharing class LeadTriggerHandler {
    public LeadTriggerHandler() {

    }
    public static void beforeInsert(List<Lead> newLeadList){
        Set<String> allowedDomains = new Set<String>();
        allowedDomains.add('example.com');
        allowedDomains.add('company.com');

        for(Lead leadRec:newLeadList){
            if(String.isNotBlank(leadRec.Email)){
                String domain = leadRec.Email.substringAfter('@').toLowerCase();
               if(!allowedDomains.contains(domain)){
                leadRec.Email=null;
               }
            }
               
        }
        

    }

    public static void beforeUpdate(List<Lead> newLeadList, Map<Id,Lead> oldLeadMap){
        Set<String> allowedDomains = new Set<String>();
        allowedDomains.add('example.com');
        allowedDomains.add('company.com');

        for(Lead leadRec:newLeadList){
            String domain = leadRec.Email.substringAfter('@').toLowerCase();
            String oldLeadEmail = oldLeadMap.get(leadRec.Id).Email;
            if(String.isNotBlank(leadRec.Email) && leadRec.Email!=oldLeadEmail){
                
               if(!allowedDomains.contains(domain)){
                leadRec.Email=null;
               }
            }
               
        }

    }


}