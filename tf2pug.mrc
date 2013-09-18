;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;SCRIPT INITIALIZATION;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;initialize script and ask for options from the user
on *:load:{
  $pugfirstload
}

;add the toolbar icons when mIRC launches
on *:start:{
  toolbar -a Pugs "Launch TF2 Pug Form" tf2.png "/pug"
  toolbar -a PugAdd "Add to the pug" add.png "/pugadd"
  toolbar -a PugRem "Remove from pug" remove.png "/pugremove"
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;END SCRIPT INITIALIZATION;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;CUSTOM MENUS;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;create menu items for mIRC as shortcuts to the pug
menu menubar {

 -

launch tf2
.morning:$launch_tf2(%pughelper.steamURLMorning)
.evening:$launch_tf2(%pughelper.steamURLEvening)
.-
.mordor:$launch_tf2(%pughelper.steamURLMordor)
.rivendallas:$launch_tf2(%pughelper.steamURLRivendallas)
.-
.chicago1:$launch_tf2(%pughelper.steamURLChicago1)
.chicago2:$launch_tf2(%pughelper.steamURLChicago2)
.dallas1:$launch_tf2(%pughelper.steamURLDallas1)


-

launch mumble
.morning red:$launch_mumble(morning,red)
.morning blu:$launch_mumble(morning,blue)

.evening red:$launch_mumble(evening,red)
.evening blu:$launch_mumble(evening,blue)

.-

.mordor red:$launch_mumble(mordor,red)
.mordor blu:$launch_mumble(mordor,blue)

.rivendallas red:$launch_mumble(rivendallas,red)
.rivendallas blu:$launch_mumble(rivendallas,blue)

.-

.chicago1 red:$launch_mumble(chicago1,red)
.chicago1 blu:$launch_mumble(chicago1,blue)

.chicago2 red:$launch_mumble(chicago2,red)
.chicago2 blu:$launch_mumble(chicago2,blue)

.dallas1 red:$launch_mumble(dallas1,red)
.dallas1 blu:$launch_mumble(dallas1,blue)

}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;END CUSTOM MENUS;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;DIALOG DEFINITIONS;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;tf2 pug helper dialog definition (layout)
dialog frmTF2Pugs {
  title "TF2 Pugs"
  size -1 -1 287 107
  option dbu
  tab "Add up to Pug", 3, 0 -1 286 107
  box "Channel", 1, 5 14 277 23, tab 3
  box "Classes", 2, 5 37 277 50, tab 3
  button "Remove", 302, 45 90 37 12, tab 3
  radio "#tf2.pug.na", 101, 9 23 44 10, tab 3
  check "Scout", 201, 40 47 24 10, tab 3
  check "Pyro", 203, 93 47 22 10, tab 3
  check "Demo", 204, 118 47 24 10, tab 3
  check "Heavy", 205, 145 47 27 10, tab 3
  check "Engie", 206, 173 47 24 10, tab 3
  check "Medic", 207, 199 47 24 10, tab 3
  check "Sniper", 208, 226 47 25 10, tab 3
  check "Spy", 209, 256 47 21 10, tab 3
  button "Add", 301, 5 90 37 12, tab 3
  check "Captain", 200, 9 47 30 10, tab 3
  radio "#tf2.pug.nahl", 102, 53 23 50 10, tab 3
  radio "#tf2.mix.nahl", 103, 102 23 50 10, tab 3
  check "Roamer", 210, 65 59 29 10, tab 3
  check "Pocket", 211, 65 72 29 10, tab 3
  button "Close", 303, 245 90 37 12, tab 3 cancel
  check "Soldier", 202, 65 47 27 10, tab 3
  tab "Options", 4
  box "Pug Options", 6, 5 14 278 20, tab 4
  box "Mumble and Steam Options", 7, 5 34 278 69, tab 4
  text "Mumble Name", 8, 9 43 35 8, tab 4
  edit "", 501, 8 52 37 10, tab 4 autohs
  text "Sounds Directory", 12, 9 79 62 8, tab 4
  edit "", 504, 8 88 238 10, tab 4 autohs
  text "Steam Directory", 11, 9 61 62 8, tab 4
  edit "", 503, 8 70 271 10, tab 4 autohs
  check "Auto Toggle Sounds", 401, 7 21 58 10, tab 4
  check "Sounds On", 402, 70 21 37 10, tab 4
  check "Auto Anti AFK:", 403, 110 21 46 10, tab 4
  edit "", 502, 47 52 232 10, tab 4 autohs
  text "Mumble Directory", 9, 48 43 62 8, tab 4
  button "Save All", 505, 247 87 32 12, tab 4
  edit "", 404, 157 21 122 10, tab 4 autohs
}


;anti afk helper dialog definition (layout)
dialog frmAntiAFKHelper {
  title "Anti AFK Helper"
  size -1 -1 191 75
  option dbu
  button "I AM NOT AFK", 1, 22 37 145 21, default ok
  edit ".", 2, 22 25 145 10, autohs
  text "Please confirm that you are not AFK", 3, 22 16 144 7, center
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;END DIALOG DEFINITIONS;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;DIALOG EVENTS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ANTI AFK DIALOG EVENTS;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;anti afk dialog onload events
on *:DIALOG:frmAntiAFKHelper:init:0: {
  did -a frmTF2Pugs 404 %pughelper.antiAFKmsg
}

;anti afk dialog unload events
on *:dialog:frmAntiAFKHelper:close:*:{
  set %pughelper.antiAFKmsg $did(frmAntiAFKHelper,2).text
}

;anti AFK dialog button click
on *:dialog:frmAntiAFKHelper:sclick:1: {
  set %pughelper.antiAFKmsg $did(frmAntiAFKHelper,2).text
  msg %pughelper.activeChannel %pughelper.antiAFKmsg 
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END AFK DIALOG EVENTS;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;TF2 HELPER FORM DIALOG EVENTS;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;initialize the TF2 helper form loading variables and setting the viewstate to the correct data
on *:DIALOG:frmTF2Pugs:init:0: {

  ; set the radio button to the correct pug channel
  if (%pughelper.activeChannel == %pughelper.channel1) {
    did -c frmTF2Pugs 101
  }
  if (%pughelper.activeChannel == %pughelper.channel2) {
    did -c frmTF2Pugs 102
  }
  if (%pughelper.activeChannel == %pughelper.channel3) {
    did -c frmTF2Pugs 103
  }

  ;set the auto toggle sounds checkbox
  if (%pughelper.autoToggleSounds == 1) {
    did -c frmTF2Pugs 401
  }

  ;set the enable sounds checkbox
  if (%pughelper.enableSounds == 1) {
    did -c frmTF2Pugs 402
  }

  ;set the auto anti afk checkbox
  if (%pughelper.antiAFK == 1) {
    did -c frmTF2Pugs 403
  }

  ;fill all of the text boxes with the appropriate settings
  did -a frmTF2Pugs 404 %pughelper.antiAFKmsg
  did -a frmTF2Pugs 501 %pughelper.mumbleUsername
  did -a frmTF2Pugs 502 %pughelper.mumbleDirectory
  did -a frmTF2Pugs 503 %pughelper.steamDirectory
  did -a frmTF2Pugs 504 %pughelper.mircSoundDirectory

  ;set all of the class checkboxes
  if (%pughelper.addCaptain == 1) did -c frmTF2Pugs 200
  if (%pughelper.addScout == 1) did -c frmTF2Pugs 201
  if (%pughelper.addSoldier == 1) did -c frmTF2Pugs 202
  if (%pughelper.addPyro == 1) did -c frmTF2Pugs 203
  if (%pughelper.addDemo == 1) did -c frmTF2Pugs 204
  if (%pughelper.addHeavy == 1) did -c frmTF2Pugs 205
  if (%pughelper.addEngineer == 1) did -c frmTF2Pugs 206
  if (%pughelper.addMedic == 1) did -c frmTF2Pugs 207
  if (%pughelper.addSniper == 1) did -c frmTF2Pugs 208
  if (%pughelper.addSpy == 1) did -c frmTF2Pugs 209
  if (%pughelper.addRoamer == 1) did -c frmTF2Pugs 210
  if (%pughelper.addPocket == 1) did -c frmTF2Pugs 211

}


;dialog unload events
on *:dialog:frmTF2Pugs:close:*:{
  $save_dialog_options
}

;saves all the dialog options
alias -l save_dialog_options {

  set %pughelper.antiAFKmsg $did(frmTF2Pugs,404).text
  set %pughelper.mumbleUsername $did(frmTF2Pugs,501).text
  set %pughelper.mumbleDirectory $did(frmTF2Pugs,502).text
  set %pughelper.steamDirectory $did(frmTF2Pugs,503).text
  set %pughelper.mircSoundDirectory $did(frmTF2Pugs,504).text 

}

;set active channel to tf2.pug.na from dialog
on *:dialog:frmTF2Pugs:sclick:101: {
  if ($did(frmTF2Pugs,101).state == 1) set %pughelper.activeChannel $(%pughelper.channel1)
}

;set active channel to tf2.pug.nahl from dialog
on *:dialog:frmTF2Pugs:sclick:102: {
  if ($did(frmTF2Pugs,102).state == 1) set %pughelper.activeChannel $(%pughelper.channel2)
}

;set active channel to tf2.pug.nahl from dialog
on *:dialog:frmTF2Pugs:sclick:103: {
  if ($did(frmTF2Pugs,103).state == 1) set %pughelper.activeChannel $(%pughelper.channel3)
}


;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:200: {
  $toggle_captain($did(frmTF2Pugs,200).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:201: {
  $toggle_scout($did(frmTF2Pugs,201).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:202: {
  $toggle_soldier($did(frmTF2Pugs,202).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:203: {
  $toggle_pyro($did(frmTF2Pugs,203).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:204: {
  $toggle_demo($did(frmTF2Pugs,204).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:205: {
  $toggle_heavy($did(frmTF2Pugs,205).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:206: {
  $toggle_engineer($did(frmTF2Pugs,206).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:207: {
  $toggle_medic($did(frmTF2Pugs,207).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:208: {
  $toggle_sniper($did(frmTF2Pugs,208).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:209: {
  $toggle_spy($did(frmTF2Pugs,209).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:210: {
  $toggle_roamer($did(frmTF2Pugs,210).state)
}

;toggle captain from dialog
on *:dialog:frmTF2Pugs:sclick:211: {
  $toggle_pocket($did(frmTF2Pugs,211).state)
}


;add from dialog
on *:dialog:frmTF2Pugs:sclick:301: {
  $pug_add
}

;remove from dialog
on *:dialog:frmTF2Pugs:sclick:302: {
  $pug_remove
}

;toggle auto sound toggle
on *:dialog:frmTF2Pugs:sclick:401: {
  $toggle_auto_sound($did(frmTF2Pugs,401).state)
}

;toggle sound from dialog
on *:dialog:frmTF2Pugs:sclick:402: {
  $toggle_sounds($did(frmTF2Pugs,402).state)
}

;toggle anti afk
on *:dialog:frmTF2Pugs:sclick:403: {
  $toggle_antiafk($did(frmTF2Pugs,403).state)
}

;Save button on helper form
on *:dialog:frmTF2Pugs:sclick:505: {
  $save_dialog_options
}

;Note: Close button doesn't have an event because it's a "Cancel" button so it closes the form

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;END TF2 HELPER FORM DIALOG EVENTS;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;END DIALOG EVENTS;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;ALIASES (COMMANDS);;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;reload initial configuration
alias pugrehash {

  $pugfirstload

}

;Applies default settings
alias pugfirstload {
  echo -a ********************************************************************
  echo -a 0
  echo -a 5tf2.pug helper 1by 6Dad - https://github.com/Faek/mirc-tf2-pug-script
  echo -a type 5/pughelp 1for commands
  echo -a bug reports: 6Dad 1on 6Gamesurge
  echo -a 0
  echo -a ********************************************************************
  set %pughelper.mircSoundDirectory sounds\
  set %pughelper.channel1 #tf2.pug.na
  set %pughelper.channel2 #tf2.pug.nahl
  set %pughelper.channel3 #tf2.mix.nahl
  set %pughelper.activeChannel $(%pughelper.channel1)
  set %pughelper.enableSounds 0
  set %pughelper.autoToggleSounds 1
  set %pughelper.antiAFK 0
  set %pughelper.antiAFKmsg Dad's TF2 Pug Script Anti-AFK: https://github.com/Faek/mirc-tf2-pug-script
  set %pughelper.addCaptain 0
  set %pughelper.addScout 0
  set %pughelper.addSoldier 0
  set %pughelper.addPyro 0
  set %pughelper.addDemo 0
  set %pughelper.addHeavy 0
  set %pughelper.addEngineer 0
  set %pughelper.addMedic 0
  set %pughelper.addSniper 0
  set %pughelper.addSpy 0
  set %pughelper.addRoamer 0
  set %pughelper.addPocket 0
  set %pughelper.steamURLChicago1 steam://connect/chicago1.tf2pug.com:27015/tf2pug
  set %pughelper.steamURLChicago2 steam://connect/chicago2.tf2pug.com:27015/tf2pug
  set %pughelper.steamURLDallas1 steam://connect/dallas1.tf2pug.com:27015/tf2pug
  set %pughelper.steamURLMordor steam://connect/demonslair.game.nfoservers.com:27015/jimmy
  set %pughelper.steamURLRivendallas steam://connect/hldallas.game.nfoservers.com:27015/timmy
  set %pughelper.steamURLMorning steam://connect/morning.tragicservers.com:27015/whythismap
  set %pughelper.steamURLEvening steam://connect/evening.tragicservers.com:27015/whythismap
  $pugopts
}

;Display pug helper commands to user
alias pughelp {
  echo -a ************************************************************************************************
  echo -a 0
  echo -a 5tf2.pug helper 1by 6Dad - https://github.com/Faek/mirc-tf2-pug-script
  echo -a 3Available Commands:
  echo -a 5/pug 1: Shows the tf2.pug helper form
  echo -a 5/pugopts 1: Shows the tf2.pug helper form options. Please fill out these values correctly or the auto-launch won't work.
  echo -a 5/pugchannel 2[channel] 1: changes active channel between $(%pughelper.channel1) and $(%pughelper.channel2) and $(%pughelper.channel3)
  echo -a 3Add and remove commands:
  echo -a 5Toggle Classes 1: /captain /scout /soldier /pyro /demo /heavy /engineer /medic /sniper /spy /roamer /pocket
  echo -a 5/pugadd 1: Adds to pug as the selected classes you have toggled on the UI or with Commands
  echo -a 5/pugremove 1: Removes from pug
  echo -a 5/mumble 2[server] [team] 1: connect to mumble manually. Servers: chicago1, chicago2, dallas1, mordor, rivendallas, morning, evening Teams: red, blue
  echo -a 5/tf2 2[server] 1: connect to tf2 server manually. Servers: chicago1, chicago2, dallas1, mordor, rivendallas, morning, evening
  echo -a 3Configuration:
  echo -a 5/pugantiafk 1: Toggles anti afk ON or OFF
  echo -a 5/antiafkmsg 2[message] 1: Set anti-afk message. Current: $(%pughelper.antiAFKmsg)
  echo -a 5/pugsounds 1: Toggles the sounds ON or OFF
  echo -a 5/pugautosounds 1: Toggles Auto Sounds ON and OFF 
  echo -a 5/pugsounddirectory 1: set pug sounds directory. Current directory: $(%pughelper.mircSoundDirectory)
  echo -a 5/mumbleusername 1: set your mumble user name. Current: $(%pughelper.mumbleUsername)
  echo -a 5/mumbledirectory 1: set your mumble directory. Current: $(%pughelper.mumbleDirectory)
  echo -a 5/steamdirectory 1: set your steam directory. Current: $(%pughelper.steamDirectory)
  echo -a bug reports: 6Dad 1on 6Gamesurge
  echo -a 0
  echo -a ************************************************************************************************
}


;show anti afk dialog


;advertise this script to the channel
alias advert {

  msg $chan I am using Dad's TF2 Pug Script for mIRC! Get it here: https://github.com/Faek/mirc-tf2-pug-script

}

;display the pug helper dialog on the first tab
alias pug {
  if ($dialog(frmTF2Pugs) == $null) {
    dialog -mv frmTF2Pugs frmTF2Pugs
  }
}

;display the pug helper form on the options tab
alias pugopts {

  $pug
  did -fu frmTF2Pugs 4

}

;add to the pug
alias pugadd {

  $pug_add

}

;toggle sounds on and off
alias pugsounds { 
  if (%pughelper.enableSounds == 1) {
    $toggle_sounds(0)
  }
  else {
    $toggle_sounds(1)              
  }
}

;toggle pug auto sounds on and off
alias pugautosounds { 
  if (%pughelper.autoToggleSounds == 1) {
    $toggle_auto_sound(0)
  }
  else {
    $toggle_auto_sound(1)              
  }
}

;toggle auto anti afk on and off
alias antiafk { 
  if (%pughelper.antiAFK == 1) {
    $toggle_antiafk(0)
  }
  else {
    $toggle_antiafk(1)              
  }
}

;set the anti afk message via the command line
alias antiafkmsg {
  set %pughelper.antiAFKmsg $1-
  echo -a Anti AFK Message set to $1-
}

;set sounds directory
alias pugsounddirectory {
  var %x $?="Enter the path to your sounds. Make sure it ends with a \ or it won't work. Example: C:\Program Files\mIRC\sounds\"
  if ($len(%x) > 0) {
    set %pughelper.mircSoundDirectory $(%x)
  }
}

;set mumble user name
alias mumbleusername {
  var %x $?="Enter your mumble username."
  if ($len(%x) > 0) {
    set %pughelper.mumbleUsername $(%x)
  }
}

;set mumble directory
alias mumbledirectory {
  var %x $?="Enter the path to mumble. Make sure it ends with a \ or it won't work. Example: C:\Program Files\mumble\"
  if ($len(%x) > 0) {
    set %pughelper.mumbleDirectory $(%x)
  }
}

;launch mumble manually with a command
alias mumble {

  $launch_mumble($1,$2)

}

;launch tf2 manually with a command
alias tf2 {

  if (chicago1 == $1) { 
    $launch_tf2(%pughelper.steamURLChicago1)
  }
  if (chicago2 == $1) { 
    $launch_tf2(%pughelper.steamURLChicago2)
  }
  if (dallas1 == $1) { 
    $launch_tf2(%pughelper.steamURLDallas1)
  }
  if (mordor == $1) { 
    $launch_tf2(%pughelper.steamURLMordor)
  }
  if (rivendallas == $1) { 
    $launch_tf2(%pughelper.steamURLRivendallas)
  }
  if (morning == $1) { 
    $launch_tf2(%pughelper.steamURLMorning)
  }
  if (evening == $1) { 
    $launch_tf2(%pughelper.steamURLEvening)
  }

}

;set steam directory
alias steamdirectory {
  var %x $?="Enter the path to Steam. Make sure it ends with a \ or it won't work. Example: C:\Program Files\steam\"
  if ($len(%x) > 0) {
    set %pughelper.steamDirectory $(%x)
  }
}

;set active pug channel
alias pugchannel {

  if ($1 == %pughelper.channel1) || ($1 == %pughelper.channel2) || ($1 == %pughelper.channel3) { 
    echo -a Current channel set to $1   
    set %pughelper.activeChannel $1
  }
  else {
    echo -a Not a valid channel: $1
  }

}



;remove aliase
alias pugremove { $pug_remove }


;toggle class aliases
;toggle adding up as captain
alias captain { 
  if (%pughelper.addCaptain == 1) {
    $toggle_captain(0)
  }
  else {
    $toggle_captain(1)              
  }
}
;toggle adding up as scout
alias scout { 
  if (%pughelper.addScout == 1) {
    $toggle_scout(0)
  }
  else {
    $toggle_scout(1)              
  }
}
;toggle adding up as soldier
alias soldier { 
  if (%pughelper.addSoldier == 1) {
    $toggle_soldier(0)
  }
  else {
    $toggle_soldier(1)              
  }
}
;toggle adding up as pyro
alias pyro { 
  if (%pughelper.addPyro == 1) {
    $toggle_pyro(0)
  }
  else {
    $toggle_pyro(1)              
  }
}
;toggle adding up as demo
alias demo { 
  if (%pughelper.addDemo == 1) {
    $toggle_demo(0)
  }
  else {
    $toggle_demo(1)              
  }
}
;toggle adding up as heavy
alias heavy { 
  if (%pughelper.addHeavy == 1) {
    $toggle_heavy(0)
  }
  else {
    $toggle_heavy(1)              
  }
}
;toggle adding up as engineer
alias engineer { 
  if (%pughelper.addEngineer == 1) {
    $toggle_engineer(0)
  }
  else {
    $toggle_engineer(1)              
  }
}
;toggle adding up as medic
alias medic { 
  if (%pughelper.addMedic == 1) {
    $toggle_medic(0)
  }
  else {
    $toggle_medic(1)              
  }
}
;toggle adding up as sniper
alias sniper { 
  if (%pughelper.addSniper == 1) {
    $toggle_sniper(0)
  }
  else {
    $toggle_sniper(1)              
  }
}
;toggle adding up as spy
alias spy { 
  if (%pughelper.addEngineer == 1) {
    $toggle_spy(0)
  }
  else {
    $toggle_spy(1)              
  }
}
;toggle adding up as roamer
alias roamer { 
  if (%pughelper.addRoamer == 1) {
    $toggle_roamer(0)
  }
  else {
    $toggle_roamer(1)              
  }
}
;toggle adding up as pocket
alias pocket { 
  if (%pughelper.addPocket == 1) {
    $toggle_pocket(0)
  }
  else {
    $toggle_pocket(1)              
  }
}

;test anti afk dialog
alias testantiafk {
  if ($dialog(frmAntiAFKHelper) == $null) {
    if (%pughelper.enableSounds == 1) {
      splay -q %pughelper.mircSoundDirectory $+ afk.wav
    } 
    dialog -mdrov frmAntiAFKHelper frmAntiAFKHelper
  }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;END ALIASES (COMMANDS);;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;LOCAL ALIASES (FUNCTIONS);;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;toggles add as scout 
alias -l toggle_captain {
  set %pughelper.addCaptain $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_captain.wav
  }
}

;toggles add as scout 
alias -l toggle_scout {
  set %pughelper.addScout $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_scout.wav
  }
}

;toggles add as soldier
alias -l toggle_soldier {
  set %pughelper.addSoldier $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_soldier.wav
  }
}

;toggles add as pyro
alias -l toggle_pyro {
  set %pughelper.addPyro $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_pyro.wav
  }
}

;toggles add as demo
alias -l toggle_demo {
  set %pughelper.addDemo $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_demo.wav
  }
}

;toggles add as heavy
alias -l toggle_heavy {
  set %pughelper.addHeavy $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_heavy.wav
  }
}

;toggles add as engineer
alias -l toggle_engineer {
  set %pughelper.addEngineer $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_engineer.wav
  }
}

;toggles add as medic
alias -l toggle_medic {
  set %pughelper.addMedic $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_medic.wav
  }
}

;toggles add as sniper
alias -l toggle_sniper {
  set %pughelper.addSniper $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_sniper.wav
  }
}

;toggles add as spy
alias -l toggle_spy {
  set %pughelper.addSpy $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_spy.wav
  }
}

;toggles add as roamer
alias -l toggle_roamer {
  set %pughelper.addRoamer $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_soldier.wav
  }
}

;toggles add as pocket
alias -l toggle_pocket {
  set %pughelper.addPocket $1
  echo -a Will add as $+ $chr(32) $+ $get_classes
  if ((%pughelper.enableSounds == 1) && ($1 == 1)) {
    splay -q %pughelper.mircSoundDirectory $+ pick_soldier.wav
  }
}

;removes player from a pug
alias -l pug_remove {

  if (%pughelper.enableSounds == 1) {
    splay -q %pughelper.mircSoundDirectory $+ remove.wav
  }
  if (%pughelper.autoToggleSounds == 1) {
    $toggle_sounds(0)
  }

  msg %pughelper.activeChannel !remove
}

;turns anti afk on and off
alias -l toggle_antiafk {
  set %pughelper.AntiAFK $1  
  echo -a Anti AFK is $+ $chr(32) $+ $iif($1 == 1, on, off)
}

;turns sounds on and off
alias -l toggle_sounds {
  if ($dialog(frmTF2Pugs) != $null) {
    if ($did(frmTF2Pugs,402).state != $1) {
      if ($1 == 1) { 
        did -c frmTF2Pugs 402 
      }
      else { 
        did -u frmTF2Pugs 402 
      }
    }
  }
  set %pughelper.enableSounds $1  
  echo -a Sounds are now $+ $chr(32) $+ $iif($1 == 1, on, off) $+ $chr(32) $+ at $(%pughelper.activeChannel)
}

;toggles having the auto sound on and off
alias -l toggle_auto_sound {
  set %pughelper.autoToggleSounds $1  
  echo -a Auto toggle sounds is now $+ $chr(32) $+ $iif($1 == 1, on, off)
}

;gets a list of your selected classes from the tf2 form
alias -l get_classes {

  var %classList

  if (%pughelper.addCaptain) { %classList = %classList $+ captain $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addScout) { %classList = %classList $+ scout $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addSoldier) { %classList = %classList $+ soldier $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addPyro) { %classList = %classList $+ pyro $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addDemo) { %classList = %classList $+ demo $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addHeavy) { %classList = %classList $+ heavy $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addEngineer) { %classList = %classList $+ engineer $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addMedic) { %classList = %classList $+ medic $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addSniper) { %classList = %classList $+ sniper $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addSpy) { %classList = %classList $+ spy $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addRoamer) { %classList = %classList $+ roamer $+ $chr(32) $+ $chr(32) }
  if (%pughelper.addPocket) { %classList = %classList $+ pocket $+ $chr(32) $+ $chr(32) }
  return %classList

}

;adds you to the pug with your selected classes from the tf2 form
alias -l pug_add {

  if (%pughelper.autoToggleSounds == 1) {
    $toggle_sounds(1)
  }
  if (%pughelper.enableSounds == 1) {
    splay -q %pughelper.mircSoundDirectory $+ ready.wav
  }

  msg %pughelper.activeChannel !add $+ $chr(32) $+ $get_classes

}


;generates mumble uri for launch parameter in mumble
;parameters: $1 is the server and $2 is the team
alias -l generate_mumble_uri {
  var %connectURI mumble:// $+ %pughelper.mumbleUsername
  if (($1 == chicago1) || ($1 == chicago2) || ($1 == dallas1)) { %connectURI = %connectURI $+ :tf2pug@tf2pug.commandchannel.com:31472/ }
  if (($1 == mordor) || ($1 == rivendallas)) { %connectURI = %connectURI $+ @djedi.biz:64738/ }
  if (($1 == morning) || ($1 == evening)) { %connectURI = %connectURI $+ :powers@chi.tragicservers.com:64749/ }
  if ($1 == chicago1) { 
    %connectURI = %connectURI $+ Servers/Chicago 1/ 
    if ($2 == red) { %connectURI = %connectURI $+ Red }
    elseif ($2 == blue) { %connectURI = %connectURI $+ Blue }
  }
  if ($1 == chicago2) { 
    %connectURI = %connectURI $+ Servers/Chicago 2/ 
    if ($2 == red) { %connectURI = %connectURI $+ Red }
    elseif ($2 == blue) { %connectURI = %connectURI $+ Blue }
  }
  if ($1 == dallas1) { 
    %connectURI = %connectURI $+ Servers/Dallas 1/ 
    if ($2 == red) { %connectURI = %connectURI $+ Red }
    elseif ($2 == blue) { %connectURI = %connectURI $+ Blue }
  }
  if ($1 == mordor) { %connectURI = %connectURI $+ UGC PUG CHAN/mordor/
    if ($2 == red) { %connectURI = %connectURI $+ Red }
    if ($2 == blue) { %connectURI = %connectURI $+ Blue } 
  }
  if ($1 == rivendallas) { %connectURI = %connectURI $+ UGC PUG CHAN/rivendell/
    if ($2 == red) { %connectURI = %connectURI $+ Red }
    if ($2 == blue) { %connectURI = %connectURI $+ Blue } 
  }
  if ($1 == morning) { %connectURI = %connectURI $+ HL Mix/Morning/
    if ($2 == red) { %connectURI = %connectURI $+ red }
    if ($2 == blue) { %connectURI = %connectURI $+ blu } 
  }
  if ($1 == evening) { %connectURI = %connectURI $+ HL Mix/Evening/
    if ($2 == red) { %connectURI = %connectURI $+ red }
    if ($2 == blue) { %connectURI = %connectURI $+ blu } 
  }
  %connectURI = %connectURI $+ ?version=1.2.3
  return $chr(34) $+ %connectURI $+ $chr(34)
}

;launches mumble
;parameters: $1 is the server and $2 is the team
alias -l launch_mumble {
  run %pughelper.mumbleDirectory $+ mumble.exe $generate_mumble_uri($1,$2)
}

;launches tf2
;parameters: $1 is the steam server launch uri
alias -l launch_tf2 {
  run %pughelper.steamDirectory $+ steam.exe $1
}

;helper function to add a line to the consolidated bot messenger window
alias -l aline_tf2win {
  if ($window(@tf2pugs) == $null) {
  window @tf2pugs
    ; Opens the window if the window is  not already open
  }
  aline -p @tf2pugs $1-
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;END LOCAL ALIASES (FUNCTIONS);;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;PUBLIC CHANNEL TEXT EVENTS;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Teams are being drafted
on *:text:*Teams are being drafted*:%pughelper.activeChannel:{
  if ((Messenger isin $nick) || (Bot isin $nick)) && (%pughelper.enableSounds == 1) {
    splay -q %pughelper.mircSoundDirectory $+ teams_being_drafted.wav
  }
}

;Sub needed
on *:text:*need*sub*:%pughelper.activeChannel:{
  if (%pughelper.enableSounds == 1) {
    splay -q %pughelper.mircSoundDirectory $+ sub_needed.wav
  }
}

;Sub needed alternate
on *:text:*sub*need*:%pughelper.activeChannel:{
  if (%pughelper.enableSounds == 1) {
    splay -q %pughelper.mircSoundDirectory $+ sub_needed.wav
  }
}

;Your turn to pick
on *:text:*It is*turn to pick*:%pughelper.activeChannel:{
  if (%pughelper.enableSounds == 1) && ((Messenger isin $nick) || (Bot isin $nick)) && ($me isin $1-) {
    splay -q %pughelper.mircSoundDirectory $+ captain.wav
  }
}

;Play remove sound if sounds are on and turn sounds off if you removed from the pug if auto toggle is on
on *:INPUT:%pughelper.activeChannel:{
  if (!remove isin $1-) {
    if (%pughelper.enableSounds == 1) {
      splay -q %pughelper.mircSoundDirectory $+ remove.wav
    }
    if (%pughelper.autoToggleSounds == 1) {
      $toggle_sounds(0)
    }
  }
  if (!add isin $1-) {
    if (%pughelper.autoToggleSounds == 1) {
      $toggle_sounds(1)
    }
    if (%pughelper.enableSounds == 1) {
      splay -q %pughelper.mircSoundDirectory $+ ready.wav
    }
  }
}

; show the teams in the main pug window if you're on it
on *:text:*Red Team*:%pughelper.activeChannel:{
  if (((Messenger isin $nick) || (Bot isin $nick)) && ($me isin $1-)) {
    $aline_tf2win($1-)
  }
}

; shows the teams in the main pug window 
on *:text:*Blu Team*:%pughelper.activeChannel:{
  if (((Messenger isin $nick) || (Bot isin $nick)) && ($me isin $1-)) {
    $aline_tf2win($1-)   
  }
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;END PUBLIC CHANNEL TEXT EVENTS;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;PRIVATE MESSAGE TEXT EVENTS;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;auto launch mumble and TF2 and join the correct server/channel in mumble and the correct tf2 server
on *:TEXT:*You have been picked for*:?: {
  if ((Messenger isin $nick) || (Bot isin $nick)) {
    $aline_tf2win($1-)
    closemsg $nick
    clipboard $mid($1-, $calc($pos($1-, :) + 2))
    if (You have been picked for isin $1-) {
      var %pughelper.pickedTeam
      if (Red Team isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ red_team.wav  }
        set %pughelper.pickedTeam red
      }
      if (Blu Team isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ blue_team.wav }
        set %pughelper.pickedTeam blue
      }
      if (%pughelper.enableSounds == 1) {
        if (captain isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_captain.wav }
        elseif (scout isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_scout.wav }
        elseif (soldier isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_soldier.wav }
        elseif (roamer isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_roamer.wav }
        elseif (pocket isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_pocket.wav }
        elseif (pyro isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_pyro.wav }
        elseif (demo isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_demo.wav }
        elseif (heavy isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_heavy.wav }
        elseif (engineer isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_engineer.wav }
        elseif (medic isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_medic.wav }
        elseif (sniper isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_sniper.wav }
        elseif (spy isin $1-) { splay -q %pughelper.mircSoundDirectory $+ picked_spy.wav }
      }
      if (chicago1 isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ chicago1.wav }
        $launch_mumble(chicago1,%pughelper.pickedTeam)
        $launch_tf2(%pughelper.steamURLChicago1)
      }
      if (chicago2 isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ chicago2.wav }
        $launch_mumble(chicago2,%pughelper.pickedTeam)
        $launch_tf2(%pughelper.steamURLChicago2)
      }
      if (dallas1 isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ dallas1.wav }
        $launch_mumble(dallas1,%pughelper.pickedTeam)
        $launch_tf2(%pughelper.steamURLDallas1)
      }
      if (demonslair isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ mordor.wav }
        $launch_mumble(mordor,%pughelper.pickedTeam)
        $launch_tf2(%pughelper.steamURLMordor)
      }
      if (hldallas isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ rivendallas.wav }
        $launch_mumble(rivendallas,%pughelper.pickedTeam)
        $launch_tf2(%pughelper.steamURLRivendallas)
      }
      if (morning isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ morning.wav }
        $launch_mumble(morning,%pughelper.pickedTeam)
        $launch_tf2(%pughelper.steamURLMorning)
      }
      if (evening isin $1-) { 
        if (%pughelper.enableSounds == 1) { splay -q %pughelper.mircSoundDirectory $+ evening.wav }
        $launch_mumble(evening,%pughelper.pickedTeam)
        $launch_tf2(%pughelper.steamURLEvening)
      }
    }
    ;Disable sounds until player is added again
    if (%pughelper.autoToggleSounds == 1) {
      $toggle_sounds(0)
    }
  }
}

;Handle AFK notification from the bot
on *:text:*you are considered afk by the bot*:?:{
  if ((Messenger isin $nick) || (Bot isin $nick)) {
    if (%pughelper.antiAFK == 1) {
      ;auto afk handler, close message, and auto reply to the afk message in the chat and don't play the afk sound
      closemsg $nick
      msg %pughelper.activeChannel %pughelper.antiAFKmsg  
    } 
    else {
      ;non auto afk handler, pop up a message and require user interaction to un-afk
      if (%pughelper.enableSounds == 1) {
        splay -q %pughelper.mircSoundDirectory $+ afk.wav
      } 
      dialog -mdrov frmAntiAFKHelper frmAntiAFKHelper
      $aline_tf2win($1-)
      closemsg $nick
    }
  }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;END PRIVATE MESSAGE TEXT EVENTS;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
