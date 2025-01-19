public class ExceptionalExceptions
{
    public static void ExceptinalFirst()
    {
        try
        {
            Account Acc = [Select Id,Name,Rating from Account where Name = 'ahv1'];
        system.debug(Acc.Rating);
        }
        
        catch(DMLexception e)
        {
            system.debug(e.getMessage()+e.getStackTraceString()+e.getCause());
        }
        Catch(exception e)
        {
            system.debug(e.getMessage()+e.getStackTraceString());
        }
    }

}