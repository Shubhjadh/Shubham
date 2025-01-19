public class NovClass 
{

    public static void Methdod1()
    {
       //parent to child 
       list<Account> Acc = [select Name,Phone,(Select Name,Phone from Contacts) from account];
       if(!Acc.isEmpty())
       {
        for(Account Acc1 : Acc)
        {
            if(Acc1.Contacts != null)
            {
                for(Contact Con1 : Acc1.Contacts)
                {
                    
                }
            }

        }
       }

       //Child to parent
    }

}