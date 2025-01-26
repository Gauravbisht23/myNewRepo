trigger Triggertocountchild on Contact (after insert,after delete, after update , after undelete) 
{
    if(trigger.isupdate || trigger.isdelete)
    {
        list<id> idsofchilld = new list<id>();
        for(contact con :trigger.old)
        {
            idsofchilld.add(trigger.oldmap.get(con.id).AccountId);
        }
        
        list<contact> acc = [select id, AccountId from contact where Accountid in :idsofchilld];
        list<Account> account = new list<Account>();
        account.add(new Account(No_of_Childs__c =acc.size(),id= idsofchilld[0]));
        update account;
    }
    else
    {
        list<id> idsofchilld = new list<id>();
        for(contact con :trigger.new)
        {
            idsofchilld.add(con.Accountid);
        }
        
        list<contact> acc = [select id from contact where Accountid in :idsofchilld];
        list<Account> account = new list<Account>();
        account.add(new Account(No_of_Childs__c =acc.size(),id= idsofchilld[0]));
        update account;
    }
    
}