public class MapDemo
{
    public static void MapMethod1()
    {
        
        /*
         put(key,value),putAll(key,value),remove(),size(),values()
         Clear(),clone(),containsKey(keyvalue),equals(mmap2),get(key),isEmpty(),keyset(),
         */
        map<integer,string> mmap1 = new map<integer,string>();
        mmap1.put(1,'Shubham');
        mmap1.put(2,'Pooja');
        mmap1.put(4,'Neha');
        mmap1.remove(2);
        system.debug(mmap1);
        
        map<integer,string> mmap2 = new map<integer,string>{3 => 'harshal',6=>'prasad'};
            system.debug(mmap2);
        
        mmap1.putAll(mmap2);
        system.debug('merge map  are '+ mmap1);
        
        system.debug(mmap1.size());
        
        /*Values*/
        list<string> l1 = new list<string>();
        l1 = mmap1.values();
        system.debug('map value in set'+l1);
        system.debug(mmap1.values());
        
        system.debug(mmap1.keySet());
        
        /*clone*/
        map<integer,string> mmap3 = new map<integer,string>();
        mmap3 = mmap1.clone();
        system.debug(mmap3);
        mmap3.clear();
        system.debug(mmap3);
        
        /*Containskey*/
        system.debug(mmap1.Containskey(1));
        
        Boolean b1 = mmap1.Containskey(5);
        system.debug(b1);
        
        system.debug(mmap1.get(1));
        
        system.debug(mmap1.isEmpty());
        
       system.debug(mmap1.equals(mmap2));
        
        
        
        
        
        
            
          
        
        
        
        
    }
}