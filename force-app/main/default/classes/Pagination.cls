public class Pagination
{
private integer totalRecs = 0;
private integer OffsetSize = 0;
private integer LimitSize= 10;
public Pagination()
{List<account> Ac=[Select id, Name From Account];
totalRecs = Ac.size();
}
public List<account> getacclist()
{
List<account> acc = [SELECT Name, website, AnnualRevenue, description, Type FROM account LIMIT :LimitSize OFFSET :OffsetSize];
System.debug('Values are ' + acc);
return acc;
}
public void FirstPage()
{
OffsetSize = 0;
}
public void previous()
{
OffsetSize = OffsetSize - LimitSize;
}public void next()
{
OffsetSize = OffsetSize + LimitSize;
}public void LastPage()
{
OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
}
public boolean getprev()
{
if(OffsetSize == 0)
return true;
else
return false;
}
public boolean getnxt()
{
if((OffsetSize + LimitSize) > totalRecs)
return true;
else
return false;
}
}