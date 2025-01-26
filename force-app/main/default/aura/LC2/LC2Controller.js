({
	mul : function(component) {
        var mul1= component.get("v.a1") * component.get("v.a2");
        component.set("v.multiply",mul1);
	}
})