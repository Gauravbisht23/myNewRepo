({
	docreatemap : function(component, event, helper) {
		var Map= [];
        for( var i=0; i<20 ; i++){
            Map.push ({
                key:i,
                value: 'Test'+i
        });
        }
        component.set('v.Mapvar',Map);
	}
})