({
	doinit : function(component, event, helper) {
        var action= component.get('c.getContactList');
        action.setParams({
            accountId: component.get('v.recordId'),
        });
        
        action.setCallback(this, function(response){
                           var responsevalue= response.getReturnValue();
        console.log('responseValue', responsevalue);
                           component.set('v.contlist',responsevalue);
                           });
        $A.enqueueAction(action);
	},
    
    redirect : function(component, event, helper) {
        var eventsource= event.getSource();
        var id= eventsource.get('v.name');
        //alert(id);
         var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": id,
      "slideDevName": "detail"
    });
    navEvt.fire();
    }
})