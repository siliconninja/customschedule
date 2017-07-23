-- Copyright (c) 2017 siliconninja
-- This repository and its files are licensed under the the MIT License.

-- READ THIS: This only works if your school has a calendar (that you can subscribe to via iCal or Google Calendars which you can download as an iCal file)
-- **You must run the customschedule.scpt script FIRST before running this one to input the class events in the empty calendar.**
-- and it has the days (4, 3, 2, 1...) and you have a Mac. If you don't have a Mac, try one of the following.
-- Run this via a VM (virtual machine) or Hackintosh
-- Get someone else's Mac (with their permission) and change the class names.

-- TODO:
-- Quarterly classes (e.g. Gym, Health)
-- School events e.g. snow days, pep rallies, etc.

-- Any Mac AppleScript developers here? Please contribute your code to GitHub. It would be greatly appreciated :)
-- (repo is called customschedule, fork and use this code all you like under the MIT license) https://github.com/siliconninja/customschedule

-- * Only for non-developers or users of this app.

tell application "Calendar"
	-- Input your schedule calendar here (with the periods/events.)
	-- CHANGE THIS SO IT WORKS*.
	tell calendar "[Your Calendar Here]"
		with timeout of 600 seconds
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
			
			repeat with i from 1 to the count of C1List
				set theEvent to item i of C1List
				set location of theEvent to "Room 101"
			end repeat
			repeat with i from 1 to the count of C2List
				set theEvent to item i of C2List
				set location of theEvent to "Room 102"
			end repeat
			repeat with i from 1 to the count of C3List
				set theEvent to item i of C3List
				set location of theEvent to "Room 103"
			end repeat
			repeat with i from 1 to the count of C4List
				set theEvent to item i of C4List
				set location of theEvent to "Room 104"
			end repeat
			repeat with i from 1 to the count of C5List
				set theEvent to item i of C5List
				set location of theEvent to "Room 105"
			end repeat
			repeat with i from 1 to the count of C6List
				set theEvent to item i of C6List
				set location of theEvent to "Room 106"
			end repeat
			repeat with i from 1 to the count of C7List
				set theEvent to item i of C7List
				set location of theEvent to "Room 107"
			end repeat
			repeat with i from 1 to the count of C8List
				set theEvent to item i of C8List
				set location of theEvent to "Room 108"
			end repeat
			repeat with i from 1 to the count of P9List
				set theEvent to item i of P9List
				set location of theEvent to "Any Room"
			end repeat
			repeat with i from 1 to the count of LList
				set theEvent to item i of LList
				set location of theEvent to "Cafeteria A"
			end repeat
		end timeout
	end tell
end tell
