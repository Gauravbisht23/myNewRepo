public class kuch {

    public kuch(ApexPages.StandardController controller) {

    }


    public String accountID { get; set; }

    public static void hai(){
        
        //Creating List of all account Ids
List<id> accIdsList = new List<id>() ;

//Creating set of all account Ids
Set<id> accIdsSet = new Set<id>() ;

//Fetching all accounts
List<account> accList = new List<Account>();

//Creating Map with account id as key and account record as value
Map<Id,Account> accountIdObjMap = new Map<Id,Account>([select Id,name,site,rating,AccountNumber from account limit 50000]);

//getting list of account using map.values method
accList = accountIdObjMap.values();

//getting set of account Id's using map.keySet method
accIdsSet = accountIdObjMap.keySet();

//getting list of account Id's using list.addAll method
accIdsList.addAll(accIdsSet);
        
        system.debug(accIdsList);
        system.debug(accList);
        system.debug(accIdsSet);
    }
}