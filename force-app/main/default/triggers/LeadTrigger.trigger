trigger LeadTrigger on Lead (before insert, before update) {

    if(trigger.isInsert){
        LeadTriggerHandler.beforeInsert(trigger.new);
    }
    if(trigger.isUpdate){
      
        LeadTriggerHandler.beforeUpdate(trigger.new,trigger.oldMap);
    }
}