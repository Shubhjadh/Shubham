public class ListDemo
{
	public void ListMethod()
    {
        /*add(value),add(index,value),addAll(list/set),clear(),clone(),contains(value),equals(list),
         * get(index),indexOf(),isEmpty(),remove(value),set(index,value),size(),sort()*/
        
        list<String> s1 = new list<String>();
        list<String> l1 = new list<String>();
        set<String> sl1 = new set<String>{'Mahesh','Sandeep','Vrushi'};
        s1.add('Shubham');
        s1.add('pooja');
        l1.add('Prasdad');
        l1.add('Harshal');
        
        s1.add(1,'Radha');
        system.debug(s1);
        system.debug(l1);
        s1.addAll(l1);
        s1.addAll(sl1);
        
        
        system.debug('add list in S1'+s1);
        system.debug('add set in S1'+s1);
        
        /*list convert into set*/
        List<String> tempList = new List<String>{'A1','A2','A3','A1'}; 
        Set<String> tempSet = new Set<String>(tempList); 
        system.debug(tempList);
        system.debug(tempSet);
        
		tempSet.clear();
        system.debug(tempSet);
        
        list<String> s2 = new list<string>();
        s2 = s1.clone();
        system.debug('clone value is '+s2);
        
        /*Contains value*/
       Boolean res =  s2.contains('Shubham');
        system.debug(res);
        
        /*both list is equal or not*/
        Boolean res1 = s1.equals(s2);
        system.debug(res1);
        
        /*get specific number*/
        system.debug(s1.get(2));
        
        /*sObject type*/
        sObject sobj = [Select NAme from Account limit 1];
        system.debug(sobj.getsObjectType());
        
        Account Acc = [Select NAme from Account limit 1];
        system.debug(Acc.getsObjectType());
        
        system.debug(s1.indexOf('pooja'));
        
        system.debug(s1.isEmpty());
        system.debug(s1.size());
        s1.sort();
     
        s1.set(2,'Vidya');
        system.debug(s1);
        
        
        
        
        
        
    }
}