@echo off

:: Sends a command to the specified instance of IBC, for example to cause it
:: to initiate a tidy closedown or restart of TWS or Gateway

:: You must supply the command as the first argument when you call this
:: script. It is case-insensitive.


:: Please read the notes below and make any required changes, then save this
:: file before running it.

:: You may need to change this line. Set it to the name or IP address of the 
:: computer that is running IBC. Note that you can use the local loopback 
:: address (127.0.0.1) if IBC is running on the current machine.

set ServerAddress=127.0.0.1

:: You may need to change this line. Make sure it's set to the value of the 
:: CommandServerPort setting in config.ini:

set CommandServerPort=7462


:: IMPORTANT NOTE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
:: ==============
::
:: The following uses the telnet utility, which is not enabled in
:: Windows 'out of the box'. To enable it, run the 'Programs and Features' applet in
:: Control Panel. Click the 'Turn Windows features on or off' link in the left hand
:: panel. Then locate the 'Telnet client' entry in the list of Windows features and
:: ensure the checkbox in the entry is ticked. Click 'OK' and Windows will 
:: enable it. This command file should then run successfully.


:: You shouldn't need to change anything below this line.
::==============================================================================


if "%~1" == "" (
	echo Error: you must supply a valid IBC command as the first argument
	exit
)

:: open a telnet window with a session to IBC
set TITLE=Send Command To IBC %RANDOM%%RANDOM%%RANDOM%
start "%TITLE%" telnet %ServerAddress% %CommandServerPort% 

:: send the required command to IBC 
cscript .\Scripts\SendIBCCommand.vbs "%TITLE%" "%~1"

:: Acknowledgement: many thanks for the help contained in Mukul Goel's answer to this question at:
::    http://stackoverflow.com/questions/13197376/is-it-possible-to-use-a-batch-file-to-establish-a-telnet-session-send-a-command

