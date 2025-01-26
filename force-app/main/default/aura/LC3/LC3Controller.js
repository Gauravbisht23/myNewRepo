({
	inn : function(component) {
		var numlist=[];
        for(var i=0; i<10; i++){
            numlist.push({value:i});
        }
        component.set("v.numertype",numlist);
	},
    
    getinput : function(component,event) {
        var fname=component.find("name").get("v.value");
        var outname=component.find("opttext");
        outname.set("v.value",fname);
       
    },
    
    
   show: function(component, event, helper) {
        // Fetch the account list from the Apex controller
        helper.getAccountList(component);
      }
    
})