trigger Child on Contact (before insert) {
 set<account> ch= new set<account>();
    list<id> ck= new list<id>();
    for (contact c: trigger.new){
        ck.add(c.Accountid);
    }
    List<account> con = [SELECT id  FROM account where id=:ck];
    ch.addAll(con);
    
}