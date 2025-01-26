trigger t1 on Contact (before insert) {
    
    for (contact c : Trigger.New)
    {
        if(c.email == Null)
            c.addError('No email');
    }
    

}