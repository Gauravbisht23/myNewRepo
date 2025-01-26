public with sharing class renedered {

public boolean rend{set; get;}
public Account acc{set;get;}
public renedered(){
rend = false;
}
public pagereference mycontroller(){
rend= true;
acc=[SELECT Name , id FROM Account Limit 1];
return null;
}


}