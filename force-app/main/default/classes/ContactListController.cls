public class ContactListController {
 @AuraEnabled
    public static List<Contact> getContactList(string accountId){
        system.debug('yo'+accountId);
        List<Contact> cont= new List<Contact>([SELECT Name,FirstName,LastName, phone, Email From contact where Email != null AND Accountid =:accountId ]);
        return cont;
    }
    
    @AuraEnabled
    public static Contact createContact (Contact con, Id AccountId){
        con.Accountid = AccountId;
        system.debug('AccountId' + AccountId);
        system.debug('con' + con);
            insert con;
        return con;
    }
}