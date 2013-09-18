# tf2 pug script for mIRC by Dad

## Main Screen
![main screen](https://raw.github.com/Faek/mirc-tf2-pug-script/master/screenshot1.png)

## Options Screen
![options screen](https://raw.github.com/Faek/mirc-tf2-pug-script/master/screenshot2.png)

## AFK Desktop Popup
![afk popup](https://raw.github.com/Faek/mirc-tf2-pug-script/master/screenshot3.png)


## Features

* **Pug Helper Form:** A dialog GUI to the pug so you don't need to type commands anymore.
* **Sounds:** Sounds on all major events in pug eg: Teams being drafted, Sub Needed, afk notices, when it's your turn to pick as captain, that you have been picked and the game is starting, etc..
* **Auto Launch Mumble/TF2:** When teams are done being drafted and the pug starts, when you get a message from the pug messenger, a sound notification will tell you you what team you're on and what server, and mumble will launch and connect to the correct channel, and TF2 will launch and connect to the correct server. It also automatically sticks the server connect information into your clipboard if you need to use it in game.
* **Anti AFK:** Respond automatically to the bot's AFK message to un-afk yourself. **Note: You will be restricted FOR ONE MONTH!!!** if you do not show up to the PUG because you were ACTUALLY afk when the game started.
* **AFK Warning:** If you don't have auto anti afk on, you will get a popup in the middle of your screen telling you that you're AFK and a sound notification if you have sounds enabled. Click the button and it will reply with your anti afk message.
* **Pug Message Window:** Automatically terminates all private messages from the PUG Bot and Messengers, and sticks all of the messages into a single window so you don't have a bunch of PMs open.


## Download
[Download Here](https://github.com/Faek/mirc-tf2-pug-script/archive/master.zip) or click the download zip button on the right



## Installation Instructions

**Before you install, make sure you have mIRC installed on your system. This will not work without mIRC**

1. Extract zip file directly to your mIRC directory appdata directory
    * If you're on windows XP, extract it directly to your `C:\Program Files\mIRC` folder or wherever you have mIRC installed
    * If you're on vista, 7, or 8, extract the script to `%APPDATA%\mIRC`  There is a shortcut to that folder that comes with this script. (Also, If you hold the Windows Key + R the run dialog will pop up and just type that in to get to that folder)

2. In mIRC type `/load -rs tf2pug.mrc` or put the full path to the file in quotes if you extracted to a different directory. Click "Yes" on the dialog that asks if you would like to run the initialization commands (this configures the first time usage settings)

3. When the "Options" screen pops up as soon as you load the script:
    * Enter your Mumble user name
	* Enter the path to your mumble installation eg: `C:\Program Files (x86)\mumble\`  **Note:** make sure ALL of your paths **end with a \** or launching mumble or tf2  _will not work_.
	* Enter the path to your steam installation eg: `C:\Program Files (x86)\steam\`
	* If you want enable afk protection, enable it in the options menu as well.
	
4. Click the "Add up to Pug" tab, choose your preferred channel & classes, and hit add.

5. Type /advert to tell all of ur best buds about ur kewl new script.


## Upgrade Instructions

1. In mIRC type `/unload -rs tf2pug.mrc` or put the full path to the file in quotes if you installed to a different directory.

2. Unzip the new version and overwrite all of the original files.

3. Follow the installation instructions above.



## Commands
Note: Most commands are only for shortcuts and are available via the GUI or toolbar.

### /advert
Advertise this script in the current channel <3

### /pug 
Shows the tf2.pug helper form

### /pugopts
Shows the options tab on the helper form
    
### /pugchannel [channel]
changes active channel between #tf2.pug.na, #tf2.pug.nahl, #tf2.mix.nahl
  
### Toggle Classes
Toggles classes on and off for the pugadd command or Add button on the dialog
`/captain /scout /soldier /pyro /demo /heavy /engineer /medic /sniper /spy /roamer /pocket`
  
### /pugadd
Adds to pug as the selected classes you have toggled on the UI or with Commands
  
### /pugremove
Removes from pug
  
### /mumble [server] [team]
connect to mumble on the **[server]** of your choice to the **[team]** of your choice. 
`Servers: chicago1, chicago2, dallas1, mordor, rivendallas, morning, evening`
`Teams: red, blue`
 
### /tf2 [server]
Connect to tf2 server. 
`Servers: chicago1, chicago2, dallas1, mordor, rivendallas, morning, evening`
  
### /pugantiafk
Toggles anti afk ON or OFF
  
### /antiafkmsg [message]
Set anti-afk message to [message]. Default message: :)
  
### /pugautosounds
Toggles Auto Sounds ON and OFF (Turns sounds on when you're added up, and sounds off after the game starts)
  
### /pugsounds
Toggles the sounds ON or OFF (Note: if you have auto sounds on, it will get changed unless you turn auto sounds off)

### /pugsounddirectory [directory]
Set pug sounds directory to [directory]. Default directory: sounds/
  
### /mumbleusername [name]
Set your mumble user name to [name].
  
### /mumbledirectory [directory]
Set your mumble directory to [directory].
  
### /steamdirectory [directory]
Set your steam directory to [directory].



## Troubleshooting

Q: **I cannot get the script to load.**

A: Make sure you wrap the path to the script in quotes when you load it if you've extracted it to anywhere but the recommended paths, and you're typing the path correctly. eg: `/load -rs "C:\Program Files\mIRC\tf2pug.mrc"`

Q: **My sounds arent working!**

A: Did you extract the script to some weird directory? After you load the script type `/pugsounddirectory [filepath]` and type in the path to your sounds into the dialog that pops up. But make sure it ends with a trailing backslash or it won't work! eg: `"C:\MyPath\ToTheScript\sounds\"` the last \ is important!

## Bug Reports or Questions
Contact Dad on Gamesurge, or leave a bug report here on Github.

## Changelog

0.9 First public release of the 2013 version



