({
	doAdd : function(component, event, helper) {
		var Number1= component.get('v.Input1');
        var Number2= component.get('v.Input2');
       // alert(parseInt(Number1)+parseInt(Number2));
        component.set('v.Output',parseInt(Number1)+parseInt(Number2));
	},
    
    doSub : function(component, event, helper) {
		var Number1= component.get('v.Input1');
        var Number2= component.get('v.Input2');
       // alert(parseInt(Number1)-parseInt(Number2));
        component.set('v.Output',parseInt(Number1)-parseInt(Number2) );
	},
    
    domul : function(component, event, helper) {
		var Number1= component.get('v.Input1');
        var Number2= component.get('v.Input2');
        alert(parseInt(Number1)*parseInt(Number2));
         component.set('v.Output',parseInt(Number1)*parseInt(Number2));
	},
    
     doDiv : function(component, event, helper) {
		var Number1= component.get('v.Input1');
        var Number2= component.get('v.Input2');
        alert(parseInt(Number1)/parseInt(Number2));
          component.set('v.Output',parseInt(Number1)/parseInt(Number2) );
	},
})