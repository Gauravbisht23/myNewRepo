public class AccountContactMapper {
    
    // Method to get the map of Accounts and their related Contacts
    public static Void getAccountContactMap() {
        // Create a map to store Account as key and list of Contacts as value
        Map<Account, List<Contact>> accountContactMap = new Map<Account, List<Contact>>();
      
        // Query Contacts and include the related Account information
        List<Contact> contactsWithAccounts = [
            SELECT Id, Name, Account.Id, Account.Name
            FROM Contact
            WHERE AccountId != null
        ];
        
        // Iterate over the Contacts
        for (Contact contact : contactsWithAccounts) {
            Account acc = contact.Account;
            
            // If the account is not already in the map, add it with an empty list
            if (!accountContactMap.containsKey(acc)) {
                accountContactMap.put(acc, new List<Contact>());
            }
            
            // Add the contact to the corresponding account's list
            accountContactMap.get(acc).add(contact); 
        }
        List<contact> Allcon = new List<contact>();
        
        for(List<contact> con: accountContactMap.values()){
            Allcon.addall(con);
        }
        //System.debug();
        system.debug('Allcon.size()' + Allcon.size());
        List <Contact> c= new List<contact>(Allcon.clone());
        system.debug('c.size()' + c.size());
        String check= (c.isEmpty())? 'yes': 'no';
        system.debug('check' + check);
        System.debug('accountContactMap' + accountContactMap);
    }
}