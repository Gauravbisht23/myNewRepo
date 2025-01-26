public class Newopp {
 @AuraEnabled
    public static string getOpportunityLineItems(String opportunityId) {
        opportunity op= new opportunity();
        
        string newurl= '/lightning/r/Opportunity/\''+opportunityId+'\'/clone';
        
        return newurl;
    }
}