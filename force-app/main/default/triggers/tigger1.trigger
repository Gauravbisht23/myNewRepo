trigger tigger1 on Account (before insert, before update) {
    
    for(Account C: Trigger.new){
        c.Description='Ye toh description'+ userInfo.getUserName() ;
    }

}