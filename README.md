# BerlinClock
    
The Berlin Clock tells the time using a series of illuminated coloured blocks

# Prerequisites

 1. iOS 10.0+ / macOS 10.12 
 2. Xcode 9+
 3. Swift 4+

  
# Installation
Once XCode 9 and above is installed one can clone this repo to local machine using https://github.com/nativeiOSDev/2019_DEV_168/.
Open the .xcodeproj file & run the application by selecting iPhone simulator

# Features

Inorder to correctly interpret the time below given rules must be followed

1. The top lamp blinks to show seconds- it is illuminated on even seconds and off on odd seconds.
2. The first two rows represent hours where upper row represents 5 hour blocks and is made up of 4 red lamps whereas the lower row 
   represents 1 hour blocks and is also made up of 4 red lamps.
3. The last two rows represent the minutes where the upper row represents 5 minute blocks & is made up of 11 lamps 
   every third lamp is red the rest are yellow whereas the last row represents 1 minute blocks, and is made up of 4 yellow lamps.
