@isTest
public class ScheduleApexTest 
{
	@isTest
    static void Method1()
    {
        Account Acc = New Account(Name = 'Shubham',Phone = '9689968899');
        insert Acc;
        
        Contact Con1 = new Contact(FirstName = Acc.Name,LastName = 'Jadhav',Phone = '968898989898',AccountId = Acc.Id);
        Contact Con2 = new Contact(FirstName = Acc.Name,LastName = 'Jadhav',Phone = '968898989898',AccountId = Acc.Id);
        insert new list<Contact>{Con1,Con2};
            
         Test.startTest();
        	System.schedule('Weekly Account Fax Update', '0 0 1 * * ?', new ScheduleApex1());
        Test.stopTest();
        
        Contact ConNew = [Select NAme,Phone,Id from Contact where Id  =:Con1.id];
        system.assertEquals('9689968899',ConNew.phone,'Contact phone should match account phone');
        
    }
}