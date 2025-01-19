public class SetDemo
{
	public static void SetMethod1()
    {
        
        /*add(),addAll(from list),addAll(from set),clear(),clone(),contains(value),containsAll(set),equals()
         * isEmpty(),remove(),removeAll(list),removeAll(set),retainAll(set/list),size()*/
        
        set<integer> s1 = new set<integer>{12,23,13,25,65,34,65};
            set<integer> s2 = new set<integer>{89,43,23,13,53,12};
                
                system.debug('1st Set -'+s1);
        system.debug('2st Set -'+s2);
        
        s1.add(100);
        s2.add(453);
        
        system.debug('1st Set updated -'+s1);
        system.debug('2st Set updated-'+s2);
        
        s1.addAll(s2);
        system.debug('Added 2 sets values'+s1);
        
        /*Contains*/
        system.debug(s1.contains(12));
        Boolean b = s1.contains(22);
        system.debug(b);
        
        /*ContainsAll - check s2 in s1*/
        system.debug(s1.ContainsAll(s2));
        
        system.debug(s1.equals(s2));
        
        /*isEmpty*/
        system.debug(s1.isEmpty());
        Boolean b1 = s1.isEmpty();
        system.debug(b1);
        
        /*size*/
        system.debug(s1.size());
        
        /*remove*/
        system.debug(s1.remove(12));
        
        system.debug(s1);
        /*removeall
        s1.removeall(s2);
        system.debug(s1);*/
        
        /*retailAll shows only s2 values*/
        s1.retainAll(s2);
        system.debug(s1);
        
        
        
        
    }
}