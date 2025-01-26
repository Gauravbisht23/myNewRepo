public class AddmultipleAccountsController {
Account account = new Account();
public list<Account> listAccount{ get; set; }

public AddmultipleAccountsController()
{
listAccount=new list<Account>();
listAccount.add(account);
}

Public void addAccount()
{
Account acc = new Account();
listAccount.add(acc);
}
public PageReference saveAccount() {
for(Account ac : listAccount)
{
insert ac;
}
return null;  // I am returning another vf page here.
}
}