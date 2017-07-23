CustomSchedule
==============

This is a script to automate schedule creation for use in a separate calendar for schools that have a rotating schedule and a iCal version of their calendars. Basically, it helps organize a school day for students in a universal format (calendar) for use in other applications. Create your own custom schedule with classes for each day (4, 3, 2, 1, and minimum) in a custom calendar.

**Don't forget to subscribe to your school's calendar AND create an empty calendar to put your schedule in!**

UPDATE: Now with free periods and scheduled sleep ins! (source code in customschedule.scpt file)

### License:
MIT license (see [LICENSE](LICENSE) for details.)

==============
## How to use:

This only works if your school has a calendar (that you can subscribe to via iCal or Google Calendars which you can download as an iCal file) and it has the days (4, 3, 2, 1...) and you have a Mac. If you don't have a Mac, try one of the following.

- Run this via a VM (virtual machine) or Hackintosh
- Get someone else's Mac (with their permission) and change the class names.

### Notes:
- 11 is for a free period, it will be called "Free Period" and will only run when you set 11 in Day[x]O array and it is a normal, scheduled free.

- 10 is for lunch.

Change these lines of code (when you've downloaded the AppleScript) to tweak to your class schedule (you need 2 calendars, one for your school and one for your schedule):

[1]


```applescript
	-- Set "Classes" to the calendar you want your classes to go into.
	-- CHANGE NEXT LINE SO IT WORKS*
	tell application "Calendar" to tell calendar "[Your Classes Calendar Here]"
```
	
[/1]



[2]
```applescript
-- This is optimized for a 8-period schedule (1, 2, 3, lunch, 4, 5, 6, period 9)
-- CHANGE THIS SO IT WORKS*.
-- Set your school's start and end times here for classes. If there is no period 9, remove the entry!
set DayStartTimes to {"7:47 AM", "8:53 AM", "9:59 AM", "11:00 AM", "11:45 AM", "12:51 PM", "1:57 PM", "3:00 PM"}
set DayEndTimes to {"8:48 AM", "9:54 AM", "11:00 AM", "11:40 AM", "12:46 PM", "1:52 PM", "2:58 PM", "3:15 PM"}

-- sleep ins on next few lines in the customschedule.scpt file.

-- Minimum day times. i.e. Your school has a minimum day for 4 classes and one for 8 classes.
-- 4 classes
set MDStartTimes to {"7:47 AM", "8:53 AM", "9:59 AM", "11:05 AM"}
set MDEndTimes to {"8:48 AM", "9:54 AM", "11:00 AM", "12:06 PM"}
-- 8 classes
set MD2StartTimes to {"7:47 AM", "8:23 AM", "8:59 AM", "9:35 AM", "10:11 AM", "10:47 AM", "11:23 AM", "11:59 AM"}
set MD2EndTimes to {"8:18 AM", "8:54 AM", "9:30 AM", "10:06 AM", "10:42 AM", "11:18 AM", "11:54 AM", "12:30 PM"}
-- Class names i.e. Math, Science, English
set classNames to {"Class 1", "Class 2", "Class 3", "Class 4", "Class 5", "Class 6", "Class 7", "Class 8", "Period 9", "Lunch"}
-- period orders, 10 is for lunch, 11 is for a free period.
set pd4O to {4, 1, 2, 10, 8, 5, 6, 9}
set pd3O to {3, 4, 1, 10, 7, 8, 5, 9}
set pd2O to {2, 3, 4, 10, 6, 7, 8, 9}
set pd1O to {1, 2, 3, 10, 5, 6, 7, 9}
-- 4 classes
set minDay1O to {1, 2, 3, 4}
set minDay2O to {5, 6, 7, 8}
-- 8 classes
set minDay3O to {1, 2, 3, 4, 5, 6, 7, 8}
```

[/2]

[3]

```applescript
-- Subscribe to your school's calendar via iCal (calendars) and input the calendar name here.
-- CHANGE THIS SO IT WORKS*.
	tell calendar "[Your Calendar Here]"
		-- Day 4, 3, 2, and 1 events, i.e. your school says "4 Day" for Day 4, change "Day 4" to "4 Day".
		-- CHANGE THIS SO IT WORKS*.
		set Day4List to every event whose summary contains "Day 4"
		set Day3List to every event whose summary contains "Day 3"
		set Day2List to every event whose summary contains "Day 2"
		set Day1List to every event whose summary contains "Day 1"
		-- sleep ins on .scpt file.
		
		-- Same thing for Early Dismissal.
		set MinDayList to every event whose summary contains "Early Dismissal"




```
[/3]

==============
### Entering Room Numbers

**First, create your custom schedule by running the customschedule1 script.**

For locations.scpt, changing the code is easy. Just input your class names and the room numbers and then you're done!
(Period 1:, 2:, 3:... has to be there for the script to work.)

[1]
```applescript
tell application "Calendar"
	-- Input your schedule calendar here (with the periods/events.)
	-- CHANGE THIS SO IT WORKS*.
	tell calendar "[Your Calendar Here]"
```
[/1]

[2]
```applescript
			-- Class names: please input your class names (event names) here, including Lunch and other periods.
			-- CHANGE THIS SO IT WORKS*.
			set C1List to every event whose summary contains "Period 1: Class 1"
			set C2List to every event whose summary contains "Period 2: Class 2"
			set C3List to every event whose summary contains "Period 3: Class 3"
			set C4List to every event whose summary contains "Period 4: Class 4"
			set LList to every event whose summary contains "Lunch"
			set C5List to every event whose summary contains "Period 5: Class 5"
			set C6List to every event whose summary contains "Period 6: Class 6"
			set C7List to every event whose summary contains "Period 7: Class 7"
			set C8List to every event whose summary contains "Period 8: Class 8"
			set P9List to every event whose summary contains "Period 9: Period 9"

```
[/2]

[3]

```applescript
			repeat with i from 1 to the count of C1List
				set theEvent to item i of C1List
				set location of theEvent to "Room 101"
			end repeat
			repeat with i from 1 to the count of C2List
				set theEvent to item i of C2List
				set location of theEvent to "Room 102"
			end repeat
-- and so on...
```

[/3]

==============
## Want to Contribute?

Please request access for editing this repo if you want to make contributions. I cannot take most requests, as they may be spam unless I know that GitHub user.
Download the source code and make the commits as necessary on GitHub in the master branch (if you'd like).

If you're bored, why not try these todos?
- [x] School events i.e. snow days, pep rallies, etc. (may seem hard to implement because of the weird times)
	- [x] Free periods (may seem hard to implement because of the weird times)
- [ ] Quarterly classes (i.e. Gym, Health)


==============
## This goes great with...

- [Smartwatch Pro for Pebble](http://www.smartwatch.pro/) or [Smartwatch+ for Pebble](https://itunes.apple.com/us/app/smartwatch-for-pebble/id711357931) for viewing your classes on your wrist (does not scroll calendar events automatically)
- Your iPhone's notification center or an Android calendar widget for viewing class times as calendar events
- Agenda Watchface (Android-only): https://play.google.com/store/apps/details?id=de.janbo.agendawatchface&hl=en
- [LINKS DOWN] Pebble Smartwatch Diary Face 2.0 Watchface (http://www.mypebblefaces.com/apps/9400/8417/) so you can see your next classes anytime on your wrist, or Modern Calendar (http://www.mypebblefaces.com/apps/9400/6700/)
