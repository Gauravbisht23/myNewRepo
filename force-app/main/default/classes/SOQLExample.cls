public with sharing class SOQLExample {
List<AccountWrapper> accounts {set; get;}
        
        public SOQLExample(){
            list<Account> acclist=[SELECT Name , phone, industry
                                  From Account];
            accounts = new List<AccountWrapper>();
            
            
            for (account a: acclist){
                AccountWrapper aw = new AccountWrapper();
                aw.acc=a;
                aw.flag=false;
                accounts.add(aw);
            }
        }
}