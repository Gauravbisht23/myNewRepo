trigger AccountTrigger on Account (before insert, before update) {
if (Trigger.isBefore) {
    if (Trigger.isInsert){
     //   AccountTriggerHandler.beforeInsert(Trigger.new);
    } 
    if (Trigger.isUpdate) {
       // AccountTriggerHandler.beforeInsert(Trigger.new);
       
    }
}
if (Trigger.isAfter) {
    
    if (Trigger.isUpdate) {
      
        AccountTriggerHandler.accConPhoneMatch(Trigger.new,Trigger.oldMap);
    }
}
}