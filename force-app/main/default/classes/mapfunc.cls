public class mapfunc {
  public  map<String, List<String>> mapObj{set; get;}
    public list<SelectOption> objects {set;get;}
    public list<SelectOption> fields {Set;get;}
    public String Selected{set;get;}
    
    public mapfunc(){
        mapObj= new map<String, List<String>>();
        List<String> afields= new list<String>{'Name','Industry','Phone','Rating'};
            List<String> cfields= new list<String>{'Lastname', ' FirstName','phone'}; 
                List<String> ofields= new list<String>{'Name', ' StageName','CloseDate'};
       mapObj.put('Account', afields);
      mapObj.put('Contact', cfields);  
      mapObj.put('Opportunity', ofields);
        objects= new list<SelectOption>();
        fields= new list<SelectOption>();
        SelectOption n= new SelectOption('None','==None==');
        objects.add(n);
        fields.add(n);
           
        
        set<String>  keys= mapObj.keySet();
        for(String s:keys){
            Selectoption op= new Selectoption(s,s);
            objects.add(op);
        }
     
    }
    
    public void Search(){
    fields.clear();
        Selectoption n = new selectoption('None','==None==');
        fields.add(n);
      //   system.debug('dekho'+mapobj.get('Account'));
        if(Selected!='None'){
            List<String> fldNames= mapObj.get(Selected);
            for(String s :fldNames){
                selectoption p = new selectoption(s,s);
                fields.add(p);
            }
        }
    }
  
}