/*
--> There will be 2 tabs ( Administration | Schemas ) on left side.
	The 'Administration' tab gives us options to monitor and control the status of the MySQL server we are connected to
		The 'Server Status' view gives us a quick view of our server.alter
        The 'Startup / Shutdown' tool allows us to start or stop our database instance.
        
--> Administration --> MANAGEMENT/Server Status --> If ( running ) --> then only we can write queries or perform any operations with that connection;
		--> If ( Stopped ) --> go to INSTANCE/ Startup, Shutdown --> Start Server --> connection will run again

*/

/* Challenge-13:
From: Joe Tidyman (Owner, SloppyJoes)
Subject: Is Our Server Stuck?

Hi again…
It seems like our database might be stuck, or out of sync?
I talked with another business owner who said the server can sometimes get stuck and need to be restarted 
by a Database Administrator. Can you check the status of the server and re-start it for us?
- Joe
*/




/*
**Helpful Hint**
--------------------
for the purpose of this exercise, pretend the server
on your machine is the server in question

-- check the status of your server
-- IF it’s stopped, start it
-- IF it’s already running, stop it, then start it

NOTE: depending on the settings of your machine,
you may need to enter both your root user password,
AND possibly also your system password
(the one you use to log in to your machine)
*/

