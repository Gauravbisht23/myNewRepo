({
	doSave : function(component, event, helper) {
       
		var action = component.get('c.createContact');
         
        action.setParams({
            
            con: component.get('v.CreateContact'),
            AccountId: component.get('v.accountId')
        });
        console.log("In controller");
        action.setCallback(this, function(response) {
            
    var state = response.getState();
             alert(state);
            if(state === 'SUCCESS' || state === 'DRAFT'){
                var responseValue =  response.getReturnValue();
                
            }
           
            
    
 
    else if (state === "INCOMPLETE") {
        
    }
    
    else if (state === "ERROR") {
        var errors= response.getError(); //Array of Error
        console.log('Error',errors[0].duplicateResults );
        console.log('Error',errors[0].fieldErrors );
        console.log('Error',errors[0].statusCode );
        if(errors || errors[0].message){
            
        }
       
    }
});
        $A.enqueueAction(action);
	}
})