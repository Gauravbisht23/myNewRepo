Public class renderedExample{
  Public Boolean PBFlag{get;set;}
  Public Account[] accRec{get;set;}

Public renderedExample(){
  accRec = [select name,id,accountnumber from account limit 9];

PBFlag= false;
  }

Public void ShowPB(){
  PBFlag= true;
  }
  }