trigger CaseTrigger on Case (before insert) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            CaseTriggerHandler.beforeInsert(trigger.new);
        }
        if(trigger.isUpdate){
            CaseTriggerHandler.beforeInsert(trigger.new);
        }
    }

}