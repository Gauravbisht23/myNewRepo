({
	doClick : function(component, event, helper) {
		alert(component.isValid());
        alert(component.getName());
        component.set('v.whom',"TestValue");
        alert(component.get('v.whom'));
        //alert(component.set('v.whom',"TestValue"))
        var agecomp= component.find('testInput');
        alert(agecomp.get('v.value'));
        component.set('v.Age',agecomp);
	}
})