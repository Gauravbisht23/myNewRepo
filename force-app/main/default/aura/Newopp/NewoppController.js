({
	doInit: function( cmp, event, helper ) {
    	window.open("https://salesforce.com");
        // Get the list of the products from the source opportunity
        let action = cmp.get("c.getOpportunityLineItems");
        
        action.setParams({
            opportunityId: cmp.get("v.recordId")
        });
    }
})