trigger CaseBeforeInsert on Case (before insert)
{
	for (Case c : Trigger.new)
	{
		if (c.Date_Received__c == null)
		{
			c.Date_Received__c = System.today();
		}

		if (c.Provider_Name__c != null)
		{
			String pName = c.Provider_Name__c.replaceAll('[^A-Za-z]', '');
			if (pName.length() > 50)
			{
				c.Provider_Name__c = pName.substring(0,50);
			}
			else
			{
				c.Provider_Name__c = pName;
			}
		}
	}
}