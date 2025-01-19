public class ListClass 
{
    public static void Method1()
    {
        list<string> s1 = new list<string>{'Shubham','Pooja'};
            list<string> s2 = new list<string>{'Neha','Vidya'};
                system.debug(s1);
        system.debug(s2);
        
        s1.addall(s2);
        system.debug('concanating list '+s1);
        
        set<string> st1 = new set<string>(s1);
        system.debug('Set string '+st1);
        
        list<string> sp1 = new list<string>(st1);
        system.debug('list string '+sp1);
        
        sp1[2] = 'Piyusha';
        system.debug('list string '+sp1);
        
        sp1.set(1,'Surekha');
        system.debug(sp1);
        
        /*list<string> add = new string[2];
        add[0] = 'divya';
        add[1]= 'pooja';
        add[2] = 'Nidhi';
        system.assertEquals(2,add.size());*/
        
        system.debug(sp1.get(2));
        
        sp1.remove(2);
        
        system.debug(sp1.indexof('piyusha'));
        
        integer abc = sp1.indexof('piyusha');
        system.debug(abc);
        
        system.debug(sp1.contains('Neha'));
        
        
        
        
    }
    }