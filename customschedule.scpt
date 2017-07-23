-- Copyright (c) 2017 siliconninja
-- This repository and its files are licensed under the the MIT License.

-- READ THIS: This only works if your school has a calendar (that you can subscribe to via iCal or Google Calendars which you can download as an iCal file)
-- **You must run this script FIRST before running locations.scpt to input the class events in the empty calendar. locations.scpt adds classroom numbers as locations to the calendar events with each class.**
-- and it has the days (4, 3, 2, 1...) and you have a Mac. If you don't have a Mac, try one of the following.
-- Run this via a VM (virtual machine) or Hackintosh
-- Get someone else's Mac (with their permission) and change the class names.

-- TODO:
-- Quarterly classes (e.g. Gym, Health)
-- School events e.g. snow days, pep rallies, etc.

-- Any Mac AppleScript developers here? Please contribute your code to GitHub. It would be greatly appreciated :)
-- (repo is called customschedule, fork and use this code all you like under the MIT license) https://github.com/siliconninja/customschedule

-- * Only for non-developers or users of this app.



-- DO NOT CHANGE THIS* --

on newEvent(sclasstime, eclasstime, the_day, the_month, the_year, class_name, pdno)
	set sd to (the_month & " " & the_day & ", " & the_year & " " & sclasstime) as string
	set ed to (the_month & " " & the_day & ", " & the_year & " " & eclasstime) as string
	set theStartDate to date sd
	set theEndDate to date ed
	--set ed to date{year: the_year, day: the_day, month: the_month, 
	-- Set "Classes" to the calendar you want your classes to go into.
	-- CHANGE NEXT LINE SO IT WORKS*
	tell application "Calendar" to tell calendar "[Your Classes Calendar Here]"
		if class_name is ("Lunch" or "Free Period") then
			make new event with properties {start date:theStartDate, end date:theEndDate, summary:class_name}
		else
			make new event with properties {start date:theStartDate, end date:theEndDate, summary:"Period " & pdno & ": " & class_name}
		end if
	end tell
end newEvent

-- END DO NOT CHANGE THIS* --

-- lists
-- This is optimized for a 8-period schedule (1, 2, 3, lunch, 4, 5, 6, period 9)
-- CHANGE THIS SO IT WORKS*.
-- Set your school's start and end times here for classes. If there is no period 9, remove the entry!
set DayStartTimes to {"7:47 AM", "8:53 AM", "9:59 AM", "11:00 AM", "11:45 AM", "12:51 PM", "1:57 PM", "3:00 PM"}
set DayEndTimes to {"8:48 AM", "9:54 AM", "11:00 AM", "11:40 AM", "12:46 PM", "1:52 PM", "2:58 PM", "3:15 PM"}
-- sleep in day times, 8 class periods
set SIDayStartTimes to {"8:47 AM", "9:43 AM", "10:39 AM", "11:30 AM", "12:15 PM", "1:11 PM", "2:07 PM", "3:00 PM"}
set SIDayEndTimes to {"9:38 AM", "10:34 AM", "11:30 AM", "12:10 PM", "1:06 PM", "2:02 PM", "2:58 PM", "3:15 PM"}
-- Minimum day times. i.e. Your school has a minimum day for 4 classes and one for 8 classes.
-- 4 classes
set MDStartTimes to {"7:47 AM", "8:53 AM", "9:59 AM", "11:05 AM"}
set MDEndTimes to {"8:48 AM", "9:54 AM", "11:00 AM", "12:06 PM"}
-- 8 classes
set MD2StartTimes to {"7:47 AM", "8:23 AM", "8:59 AM", "9:35 AM", "10:11 AM", "10:47 AM", "11:23 AM", "11:59 AM"}
set MD2EndTimes to {"8:18 AM", "8:54 AM", "9:30 AM", "10:06 AM", "10:42 AM", "11:18 AM", "11:54 AM", "12:30 PM"}
-- Class names i.e. Math, Science, English
set classNames to {"Class 1", "Class 2", "Class 3", "Class 4", "Class 5", "Class 6", "Class 7", "Class 8", "Period 9", "Lunch", "Free Period"}
-- period orders, 10 is for lunch, and 11 is for a free period.
set pd4O to {4, 1, 2, 10, 8, 5, 6, 9}
set pd3O to {3, 4, 1, 10, 7, 8, 5, 9}
set pd2O to {2, 3, 4, 10, 6, 7, 8, 9}
set pd1O to {1, 2, 3, 10, 5, 6, 7, 9}
-- 4 classes
set minDay1O to {1, 2, 3, 4}
set minDay2O to {5, 6, 7, 8}
-- 8 classes
set minDay3O to {1, 2, 3, 4, 5, 6, 7, 8}

tell application "Calendar"
	-- Subscribe to your school's calendar via iCal (calendars) and input the calendar name here.
	-- CHANGE THIS SO IT WORKS*.
	tell calendar "[Your Calendar Here]"
		-- Day 4, 3, 2, and 1 events, i.e. your school says "4 Day" for Day 4, change "Day 4" to "4 Day".
		-- CHANGE THIS SO IT WORKS*.
		set Day4List to every event whose summary contains "Day 4"
		set Day3List to every event whose summary contains "Day 3"
		set Day2List to every event whose summary contains "Day 2"
		set Day1List to every event whose summary contains "Day 1"
		set SIDay4List to every event whose summary contains ("Enrichment Day" and "Day 4")
		set SIDay3List to every event whose summary contains ("Enrichment Day" and "Day 3")
		set SIDay2List to every event whose summary contains ("Enrichment Day" and "Day 2")
		set SIDay1List to every event whose summary contains ("Enrichment Day" and "Day 1")
		-- Same thing for Early Dismissal.
		set MinDayList to every event whose summary contains "Early Dismissal"
		
		--end repeat
	end tell
	
	-- DO NOT CHANGE THIS UNLESS YOU KNOW WHAT YOU ARE DOING* --
	-- Repeats all events in the list that are "Day 4"
	repeat with i from 1 to the count of Day4List
		
		set theEvent to item i of Day4List
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		repeat with i from 1 to the count of pd4O
			set theNumber to item i in pd4O
			my newEvent(item i in DayStartTimes, item i in DayEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in pd4O as string)
		end repeat
		--newEvent(" AM", "8:48 AM", dday, mmonth, yyear, "Class 1", "1")
		--set sd to date (the_day & "/" & the_month & "/" & y & " 5:00 PM")
		--set ed to date (d & "/" & y & " 11:00 PM")
		--set dateString to the_month as string
		--return dateEvent as string
		
	end repeat
	
	repeat with i from 1 to the count of Day3List
		
		set theEvent to item i of Day3List
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		repeat with i from 1 to the count of pd4O
			set theNumber to item i in pd3O
			my newEvent(item i in DayStartTimes, item i in DayEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in pd3O as string)
		end repeat
		
	end repeat
	repeat with i from 1 to the count of Day2List
		
		set theEvent to item i of Day2List
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		repeat with i from 1 to the count of pd4O
			set theNumber to item i in pd2O
			my newEvent(item i in DayStartTimes, item i in DayEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in pd2O as string)
		end repeat
		
	end repeat
	repeat with i from 1 to the count of Day1List
		
		set theEvent to item i of Day1List
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		repeat with i from 1 to the count of pd4O
			set theNumber to item i in pd1O
			my newEvent(item i in DayStartTimes, item i in DayEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in pd1O as string)
		end repeat
		
	end repeat
	-- Sleep ins...
	repeat with i from 1 to the count of SIDay4List
		
		set theEvent to item i of SIDay4List
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		repeat with i from 1 to the count of pd4O
			set theNumber to item i in pd4O
			my newEvent(item i in DayStartTimes, item i in DayEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in pd1O as string)
		end repeat
		
	end repeat
	
	repeat with i from 1 to the count of SIDay3List
		
		set theEvent to item i of SIDay3List
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		repeat with i from 1 to the count of pd4O
			set theNumber to item i in pd3O
			my newEvent(item i in DayStartTimes, item i in DayEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in pd1O as string)
		end repeat
		
	end repeat
	repeat with i from 1 to the count of SIDay2List
		
		set theEvent to item i of SIDay2List
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		repeat with i from 1 to the count of pd4O
			set theNumber to item i in pd2O
			my newEvent(item i in DayStartTimes, item i in DayEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in pd1O as string)
		end repeat
		
	end repeat
	repeat with i from 1 to the count of SIDay1List
		
		set theEvent to item i of SIDay1List
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		repeat with i from 1 to the count of pd4O
			set theNumber to item i in pd1O
			my newEvent(item i in DayStartTimes, item i in DayEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in pd1O as string)
		end repeat
		
	end repeat
	
	
	-- and minimum days.
	repeat with i from 1 to the count of MinDayList
		
		set theEvent to item i of MinDayList
		set dateEvent to start date of theEvent
		set yyear to year of dateEvent
		set mmonth to month of dateEvent
		set dday to day of dateEvent
		
		if dday is 4 then
			repeat with i from 1 to the count of minDay1O
				set theNumber to item i in minDay1O
				my newEvent(item i in MDStartTimes, item i in MDEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in minDay1O as string)
			end repeat
		else if dday is 5 then
			repeat with i from 1 to the count of minDay2O
				set theNumber to item i in minDay2O
				my newEvent(item i in MDStartTimes, item i in MDEndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in minDay2O as string)
			end repeat
		else
			repeat with i from 1 to the count of minDay3O
				set theNumber to item i in minDay3O
				my newEvent(item i in MD2StartTimes, item i in MD2EndTimes, dday, mmonth, yyear, item theNumber in classNames, item i in minDay3O as string)
			end repeat
		end if
		
	end repeat
	-- END DO NOT CHANGE THIS UNLESS YOU KNOW WHAT YOU ARE DOING* --
	
	
	
	--set theEvent to first item of theEventList
	--return summary of theEvent
end tell
