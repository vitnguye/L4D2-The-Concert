"L4D2: The Concert" by "Victor Nguyen"

["Inform ATTACK has been designed on three principles: combat should be tactical [rather than random]; the system should be easily extensible and customisable; and it should be possible to create interesting prose based on what happens during combat."]

Release along with a website, an interpreter, and the source text.

Release along with cover art.

Include Inform ATTACK by Victor Gijsbers.

[Instead of doing something other than taking or looking when the Tank is visible, say "You can't do that!"]

Use no scoring.
Use VERBOSE room descriptions.

Include Basic Screen Effects by Emily Short.

The block throwing at rule is not listed in the check throwing it at rulebook.
The prefer the player rule is not listed in the standard ai target select rulebook.
The prefer targets you press rule is not listed in the standard ai target select rulebook.
The prefer those who press you rule is not listed in the standard ai target select rulebook.

[Include Automap by Mark Tilford.]
[Include Exit Lister by Eric Eve.]

[Six built-in actions:
  ATTACK
  PARRY
  DODGE
  CONCENTRATE
  READY
  RELOAD]

Chapter - Helper Functions

The can't reach outside closed containers rule is not listed in the reaching outside rulebook.
Understand "aim" as concentrating.
Understand the command "throw" as something new.
Understand the command "throw" and "shoot" as "attack".
[The printed name of concentration is usually "power".]
Understand "infecteds" as infected.

The dead-infecteds is a list of persons that varies.

[clears out the dead hostiles]
sweeping is an action applying to nothing.
carry out sweeping(this is the standard sweeping rule):
	truncate dead-infecteds to 0 entries;
	repeat with X running through hostile persons enclosed by the location:
		if X is infected:
			if the health of X is less than 1:
				now X is in Heaven;
				fully heal X;
				add X to dead-infecteds;
		if X is Tank and the health of X is less than 1:
			now X is in Heaven;
			fully heal X;
			add X to dead-infecteds.

[aoe damage to the other infecteds]				
spreading is an action applying to nothing.

carry out spreading(this is the standard spreading rule): 
	repeat with z running through alive infected in location:
		if a random chance of 1 in 5 succeeds and z is not global defender:
			now the health of z is the health of z minus 1;		
			say "[if the health of z is less than 1]An Infected gets killed in [global attacker]'s attack[otherwise]An infected got hit by [global attacker]'s attack, but is still standing[end if]. [line break][run paragraph on]".
			[if z is killed:
				now z is in Heaven;
				Fully heal z.]

[this spawns infecteds]
spawning is an action applying to nothing.
[check spawning: if number of infected in Heaven is less than 5, instead say "Psst we're out of infecteds to move.".]
carry out spawning(this is the standard spawning rule):
	if an infected is in Heaven:
		repeat with horde running from 1 to 5:
			if a random chance of 1 in 2 succeeds:
				say "An infected heard the noises and has entered the [location]. [line break]";
				move a random infected in Heaven to location;
					
[this allows the player to use the med kit]
Understand "heal" as healing.
healing is an action applying to nothing.
check healing: if player does not carry a med kit, instead say "I need a med kit!".
carry out healing:  heal the player for 5 health; now a random med kit held by player is off-stage; say "I'm healing! Cover me!".

Chapter - Rooms

The Safe Room is a room. "The Safe Room looks like it used to be a storage room. [line break]There's graffiti scrawled all over the walls.[line break]EAST:The Hallway.[paragraph break][first time]Coach: 'Alright, heres the plan. Y'all know the Midnight Riders? They're gonna save us.'[paragraph break]
		Ellis: 'I hate to break it to ya Coach, but I don't think they're actually here.'[paragraph break]
		Coach: 'We'll set off their finale and the chopper gotta know something's up. And nobody, and I mean NOBODY has the bigger light show than the Midnight Riders.'[paragraph break]
		Rochelle:'...And that will signal the chopper! Coach, that's brilliant! ...I'm sorry about all the bad things I said about your crappy band...'[paragraph break]
		(Starring you as Nick): 'Coach, that is the stupidest idea I've ever agreed with.'[paragraph break]
		Coach: 'Alright then, everybody grab a weapon and let's move!'[line break][only][run paragraph on]"


The graffiti is scenery in Safe Room. 
The description of graffiti is "[one of]Midnight Riders R.I.P.[line break]KEEP ON RIDIN['].[line break]   WE'RE GOING TO MISS YOU RIDERS!!![line break]      Best band in the WORLD![line break]         The Riders got me through some Rough times. They will be missed RIP.[line break][or]The riders are okay...They got choppered out last night.[line break]   Probably heading off to play at a mall opening.[line break]      COWARD BASTARDS![line break]         must be nice to have enough $$$ to buy a helicopter.[line break]            We wait around for weeks while they skip to the front of the line..?[line break]               Assholes![line break][or]The Midnight Riders haven't made a good album since Born Yesterday.[line break]WHY ARE WE STILL HERE?[line break]   NOT ENOUGH BUSSES.[line break]      Not enough sense.[line break]            THEY'RE TRYING TO SAVE US![line break]              And there not.[line break]              CEDA SUCKS!!![line break]              CEDA SUCKS.[line break]              +10 REP![at random]".

The Hallway is east of Safe Room. The description of Hallway is "The hallway is dark and quiet, but you can see light ahead at the end of the hallway.[line break] WEST: Safe Room.[line break]NORTH: End of the Hallway."

North of Hallway is End of Hallway. The description of End of Hallway is "Finally some light. To the right, leads to the open stage.[line break]SOUTH is the Hallway and EAST is the Stage."

East of End of Hallway is Stage.  The description of Stage is "The stage still has the band equipment set up and  bleachers are in front of the Stage [first time][line break][only][if console is activated]Fireworks explode and rock music blares from the speakers... [end if][run paragraph on]".

East of Stage is helicopter.
Heaven is a room.
	
Chapter - Every Turn

When play begins:
	now the numbers boolean is false.
	
Every turn:
	if the survivor is not in location:
		now Rochelle is in location;
		now Coach is in location;
		now Ellis is in location;
	if a hostile person is in the location:
		try sweeping;
	if a hostile person is in Heaven:
		fully heal a random hostile in Heaven;
	if the player is killed:
		end the story saying "[The global attacker] has defeated you";
	if player is in helicopter:
		[remember to change this body of text so it won't be so wierd]
		end the story saying "[line break]You:'Get to the Chopper!'[line break]The survivors climb aboard.[line break][if Ellis is alive]Ellis:'See that? The Midnight Riders' music saves lives!'[line break][end if][if Rochelle is alive]Rochelle:'Oh hell yes!'[end if][line break][if Coach is alive]Coach: 'that's what I'm talkin' about!'[line break]You:'Coach, you're a genius! This worked!'[end if][if Ellis is killed]You:'Ellis...aw...Ellis...'[line break][end if][if Rochelle is killed]You:'Rochelle...ah, shit'[line break][end if][if Coach is killed]You:'Later, Coach...'[line break][end if][line break]The Helicopter flies away and you've managed to escape. [paragraph break][if player carries gnome]ACHIEVEMENT UNLOCKED[line break]Guardin' Gnome: Rescue Gnome Chompski from the Carnival. [paragraph break][end if][if a survivor is killed]In memory of: [line break][end if][if Rochelle is killed]Rochelle[line break][end if][if Coach is killed]Coach[line break][end if][if Ellis is killed]Ellis[line break][end if][if Coach is alive and Rochelle is alive and Ellis is alive]The Survivors have escaped.[line break][end if]".

[if the Tank is killed and player is in Stage for at least 3 turns:
		move 15 infected in heaven to location;]

Section - Scenes

Pause is a scene. "There's an eerie silence as the song switches on."
Pause begins when console is activated.
Pause ends when Pause has been happening for 2 turns.

Horde Wave is a scene. "Here they come."
When Horde Wave begins: try spawning.
Horde Wave begins when Pause has ended.
Every turn when Horde Wave is happening: 
	if number of infected in location is less than 12: 
		try spawning.
Horde Wave ends when Horde Wave has been happening for 5 turns.
[Horde Wave ends when the location is Stage and the number of alive infected in location is less than 1.]

Tank Wave is a scene. "The ground rumbles. A tank has entered the area![line break]'ROOOOAAAAR!!!'"
When Tank wave begins: now Tank is in location.
Tank Wave begins when Horde Wave has ended for at least 4 turns and number of alive infected in location is less than 1.
Tank Wave ends when Tank is in Heaven.

Rescue is a scene. "The helicopter has arrived to the EAST."
Rescue begins when Tank Wave ends.

Final Wave is a scene. "The noise from the helicopter is attracting even MORE infecteds nearby. [line break]Another Tank comes in."
[Final Wave begins when Rescue begins.]
Every turn when Final Wave is happening: 
	if number of infected in location is less than 12: 
		try spawning.

Final Wave begins when Rescue has been happening for 1 turns.

When Final Wave begins:
	now Tank is in location;
	try spawning.
	


Chapter - Weapons

Section - ak-47

[defining ak-47]
Understand "ak" and "gun" as ak-47.
ak-47 is a kind of weapon.  ak-47 is proper-named.
The damage die of a ak-47 is usually 7.
The dodgability of a ak-47 is usually 2.
The passive parry max of a ak-47 is usually 0.
The active parry max of a ak-47 is usually 0.
The maximum shots of a ak-47 is usually 6.
The current shots of a ak-47 is usually 6.
The maximum load time of a ak-47 is usually 1.
The current load time of a ak-47 is usually 0.
The weapon attack bonus of ak-47 is 4.
The damage die of ak-47 is 4.


Section - katana

A katana is a kind of weapon. 
katana is proper-named. 
The weapon attack bonus of katana is 3.
The damage die of katana is 6.
The dodgability of katana is -1.

[The weapon attack bonus of machete is 3.]
[The weapon attack bonus of katana is 3.]
[The damage die of machete is 5.]

Section - Concrete

[Concrete]
Concrete is a kind of weapon.

The dodgability of Concrete is usually 4.
The maximum shots of Concrete is usually 1.
The current shots of Concrete is usually 0.
The maximum load time of Concrete is usually 1.
The current load time of Concrete is usually 1.
The weapon attack bonus of Concrete is 5.
The damage die of Concrete is 5.

[Last carry out taking a Concrete:
	silently try readying the noun.]
	
Section - fists

Some fists is a kind of weapon. 
The Tank carries some fists. 
The damage die of the fists is 7.
The dodgability of the fists is 5[2].
The weapon attack bonus of fists is [3] 2.

Section - items

A gnome is a kind of thing. The description is "It's Gnome Chompski!"
There is a gnome in stage.
A cola is a kind of thing. The description is "Darn, it's diet."
There is a cola in stage.
Instead of drinking a cola:
	say "Now's not the time!".
	
A med kit is a kind of thing.  The description is "You can HEAL yourself with the med kit."
There is a med kit in stage.

Understand "button" as console.
console is a thing in Stage. "[if console is not activated]There's a button on the console to activate the Midnight Riders['] finale.[end if] [run paragraph on]"

The console can be activated.
Instead of pushing: now the console is activated.


Chapter - Characters

Section - Infected

A person is either alive or dead. A person is usually alive.
A infected is a kind of person. The description is "[if infected is alive]Pale, rabid and fast. The infection has driven them mad.[otherwise]It's quite dead[end if].".

The infected is usually hostile.
There are 10 infected in Stage.
There are 2 infected in Hallway.
There are 3 infected in End of Hallway.
There are 5 infected in Heaven.
The plural of infected is infected.
The health of an infected is usually 2.
The melee of an infected is usually 1.
The infected is usually alive.
The defence of an infected is usually 1.

Section - Tank

The Tank is a person. The description is "The is bigger than a Truck and looks hulk like with it's bulging muscles. The Tank's disproportionate anatomy forces it to knuckle-walk like a gorilla. The Tank's body is covered with numerous scars and lesions from previous fights, The ground shakes as it walks around.".
Tank is hostile.
The health of the Tank is 55.
The defence of the Tank is 4.
Tank carries some Concrete.
There is a Tank in Heaven.

Section - Survivors

A survivor is a kind of person.
A survivor is usually friendly.

A survivor called Rochelle is in Safe Room. The description is "[if Rochelle is killed][one of]There goes repopulating the Earth[or]I can think of two other people I would have rather seen go first[or]Good night, Rochelle[at random][otherwise]The only one in the group I don't mind being around. At least she's level headed[end if]."
A survivor called Coach is in Safe Room. The description is "[if Coach is killed][one of]Shit, Coach...I'll miss ya[or]Goddamn it, Coach, what'd you leave me with...[or]You were a hell of a man, Coach[or]Aw, Coach...Damn[at random][otherwise]Damn that fat-ass and his peppy attitude. He still hasn't told us his real name. At least he somehow manages to organize us all together....most of the time[end if]."
A survivor called Ellis is in Safe Room. The description is "[if Ellis is killed]Ellis, I'm suprised you lasted as long as you did[otherwise]Why does it not surprise me that that hillbilly knows how to use a gun[end if]."

The player carries some ak-47 called your ak-47.
Rochelle carries some ak-47 called Rochelle's ak-47.
Coach carries some ak-47 called Coach's ak-47.
Ellis carries some ak-47 called Ellis' ak-47.

The defence of player is 7.
The health of player is 30.
The health of Rochelle is 15.
The health of Coach is 15.
The health of Ellis is 15.
The initiative of the player is 0. 

Rochelle carries some katana called Rochelle's katana. 
Coach carries some katana called Coach's katana. 
Ellis carries some katana called Ellis' katana.
Player carries some katana.

[The defence of Rochelle is 1.]
[The melee of the player is 3.]

[A bat is a kind of weapon. Rochelle carries a bat.
A katana is a kind of weapon. Ellis carries a katana.
A guitar is a kind of weapon. Coach carries a guitar.][make a global varible called heal counter. Have an every turn rule that checks whether the heal counter is greater than 0 and if it is then heal by# and then decrease heal counter by one. After healing now heal counter is 3]

[Note: the player can type NUMBERS ON or NUMBERS OFF to adjust this.]

Chapter - Reports

Section - Fatal attack and death

[ [paragraph break]ACHIEVEMENT UNLOCKED[line break]Tank Burger: Kill Tank with melee weapons. ]
[Reports the final blow and death]		
A fatal flavour rule:
	if the global attacker is the Tank:
		say "The Tank smashes [global defender].";
	if the global attacker is a survivor:
		say "[global attacker] lands the finishing blow on [if global defender is an infected]an infected[otherwise]the Tank[end if]! [run paragraph on]";
	if the global attacker is player:
		say "You managed to deal the finishing blow to [if global defender is an infected]an infected[otherwise]the Tank[end if]! [run paragraph on]";
	if the global defender is the Tank:
		say "The Tank stops and collapses to the ground.[run paragraph on]"; 
		rule succeeds;
	if the global defender is an infected:
		[say "The common infected dies";
		now global defender is in Heaven;]
		rule fails;
	if the global defender is Rochelle:
		say "Rochellle has died."; 
		rule succeeds;
	if the global defender is Coach:
		say "Coach has died."; 
		rule succeeds;
	if the global defender is Ellis:
		say "Ellis has died."; 
		rule succeeds;
	if the global defender is player:
		say "You have died.";
		rule succeeds.

Section - Attack Moves

[moves just before an attack]
An attack move flavour rule:
	if the global attacker is the Tank:
		say "[if Concrete is readied]The tank throws the concrete[otherwise]The Tank's giant fists is about to [one of]pound[or]bat[or]slam[at random][end if] at [global defender]. ";
		rule succeeds;
	if the global attacker is infected:
		say "An infected [one of]shrieks[or]squeals[or]snarls[or]screeches[at random] trying to [one of]run after[or]attack[or]rush[or]dive at[at random] [global defender].";
		rule succeeds;
	if the global attacker is Rochelle:
		say "Rochelle [one of]screams[or]dashes[or]lunges[at random] at the [global defender] and prepares to [if Rochelle's katana held by Rochelle is readied]swing her katana[otherwise]fire[end if]. ";
		try spreading;
		rule succeeds;
	if the global attacker is Coach:
		say "Coach [one of]yells[or]dashes[or]lunges[at random] at the [global defender] and prepares to [if a Coach's katana held by Coach is readied]swing his katana[otherwise]fire[end if]. ";
		try spreading;
		rule succeeds;
	if the global attacker is Ellis:
		say "Ellis [one of]yells[or]rushes[or]lunges[at random] at the [global defender] and prepares to [if Ellis' katana held by Ellis is readied]swing his katana[otherwise]fire[end if]. ";
		try spreading;
		rule succeeds;
	if the global attacker is player:
		if the global defender is the Tank or the global defender is an infected:
		[fix report target]
			say "You [one of]run towards[or]make a mad dash at[or]lunge at[at random] the [global defender] and prepare to [if a random katana held by player is readied]swing your katana[end if] [if your ak-47 is readied]fire[end if]. ";
			try spreading;
			rule succeeds.

Section - Survivors landing the hit

[This says whether or not the Survivor's attack connected]
A flavour rule (this is the Tank defender flavour rule):
	if the global defender is the Tank and the global attacker is a survivor:
		if the final damage is greater than 0:
			say "[global attacker] lands a few hits on the [global defender] [if the final damage is greater than 1]and it [one of]growls[or]roars[or]snarls[at random] furiously[end if]! [run paragraph on]";
			rule succeeds;
		otherwise:
			say "[if the Tank is at dodge]The Tank stampedes out of the way of [global attacker]'s clumsy swing[otherwise if the Tank is at parry]The Tank doesn't notice [global attacker]'s attack and did no damage.[otherwise][global attacker]'s attack missed![end if][run paragraph on]";
			rule succeeds;
	if the global defender is the Tank and the global attacker is the player:
		if the final damage is greater than 0:
			say "You land a hit on the [global defender], and it roars in anger![run paragraph on]";
			rule succeeds;
		otherwise:
			say "[if the Tank is at dodge]The [global defender] evades your clumsy attack.[otherwise]You attack, but...you misjudged the distance and miss![end if][run paragraph on]";
			rule succeeds.
			
[Whether or not a Survivor's attack connected to infected]	
A flavour rule(this is the infected defender flavour rule):
	if the global defender is an infected and the global attacker is a survivor:
		if the final damage is greater than 0:
			say "[global attacker] lands a few hits on the [global defender] [if the final damage is greater than 1]and it [one of]growls[or]roars[or]snarls[at random] furiously[end if]! ";
			rule succeeds;
		otherwise:
			say "[if an infected is at dodge]An infected moves out of the way of [global attacker]'s clumsy swing[otherwise if the infected is at parry]The infected doesn't notice [global attacker]'s attack and did no damage.[otherwise][global attacker]'s attack missed![end if][run paragraph on]";
			rule succeeds;
	if the global defender is an infected and the global attacker is the player:
		if the final damage is greater than 0:
			say "You land a hit on the [global defender], and it roars in anger! [run paragraph on]";
			rule succeeds;
		otherwise:
			say "[if the infected is at dodge]The [global defender] evades your clumsy attack[otherwise]You attack, but...you misjudged the distance and miss![end if][run paragraph on]";
			rule succeeds.

Section - Hostile attack connecting

[This says whether or not the tank's attack connected]
A flavour rule (this is the Tank attacker flavour rule):
	if the global attacker is the Tank:
		if the global defender is not player:
			if final damage is greater than 0:
				if Concrete is readied:
					say "[global defender] is hit by the flying concrete.[run paragraph on]";
					rule succeeds;
				otherwise:
					say "The Tank [one of]knocks[or]whacks[or]smacks[at random] [global defender] [one of]away[or]down[or]sideways[at random], who groans in pain. [run paragraph on]";
					rule succeeds;
			otherwise:
				say "[global defender] somehow managed to avoid the Tank's attack and keep moving. [run paragraph on]";
				rule succeeds;
		if the global defender is player:
			if the final damage is greater than 0:
				if Concrete is readied:
					say "[global defender] got hit by the flying concrete.[run paragraph on]";
					rule succeeds;
				otherwise:
					say "The Tank [one of]knocks[or]swats[or]throws[at random] you [one of]away[or]and sends you flying[or]down[at random].";
					rule succeeds;
			otherwise:
				say "[if the player is at dodge] You somehow managed to dodged the Tank's attack and keep running.[otherwise]You avoided the attack.";
			rule succeeds.

[This says whether or not the infected's attack connected]
A flavour rule (this is the infected attacker flavour rule):
	if the global attacker is an infected:
		if the global defender is not player:
			if final damage is greater than 0:
				say "An infected [one of]claws[or]whacks[or]smacks[at random] [global defender], who grunts in pain.[line break][run paragraph on]";
				rule succeeds;
			otherwise:
				say "[global defender] somehow managed to avoid the infected's attack and keep moving. [run paragraph on]";
				rule succeeds;
		if the global defender is player:
			if the final damage is greater than 0:
				say "An infected [one of]smacks[or]whacks[or]punches[at random] hard and hurts you.[line break]You: '[one of]This is all going to Hell!'[or]Goddammit!'[or]Damn...'[or]Ah, Tits!'[or]SCREW THIS!'[or]What an assclown.'[or]ASSCLOWN!'[or]Shit.'[or]BITCH!'[at random] [run paragraph on]";
				rule succeeds;
			otherwise:
				say "[if the player is at dodge] You somehow managed to dodged the infected's attack and keep running[otherwise]You shove it back and it trips over backwards[end if].[line break] [run paragraph on]";
			rule succeeds.

To say Nick Taunt:
	say "You: '[one of]We're the four riders of the goddamn apocalypse![or]Take that, you mealy-mouthed bastards![or]Stick that where the sun don't shine![or]And that is how you do it![or]Candyasses![or]You don't stand a chance![or]Suck on this![or]Stick that up your ass![or]We are walking through the valley of the shadow of death, and we are kickin' ass![at random]'"

Section - reloading

Report Rochelle reloading:
	say "Rochelle: '[one of]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!'";
	rule succeeds.

Report Coach reloading:
	say "'Coach: [one of]Re-goddamn-loading[or]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!'";
	rule succeeds.

Report Ellis reloading:
	say "Ellis: '[one of]I'm 'a reload[or]Hey, I'm reloading[or]Gotta reload[or]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!'";
	rule succeeds.

Report the player reloading:
	say "You: '[one of]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!'";
	rule succeeds.
	
[Reports the tank reloading]
Report the Tank reloading:
	say "The Tank grabs a giant chunk of Concrete from the ground. ";
	rule succeeds.
	
Section - Concentrating
			
Report the Tank concentrating:
	say "[if the concentration of the Tank is 1]The Tank begins bulking up it's muscles[otherwise]The Tank fully charges[end if].";
	rule succeeds.
	
Report an actor concentrating (this is the actor concentrating prose rule):
	if the actor is an infected:
		now the global actor is the actor;
		if the concentration of the actor is greater than 1, say "An infected moves into posistion preparing to strike.";
		rule succeeds;
	if the actor is the Rochelle:
		now the global actor is the actor;
		if the concentration of the actor is greater than 1, say "Rochelle moves into posistion preparing to strike.";
		rule succeeds;
	if the actor is Coach:
		now the global actor is the actor;
		if the concentration of the actor is greater than 1, say "Coach moves into posistion preparing to strike.";
		rule succeeds;
	if the actor is Ellis:
		now the global actor is the actor;
		if concentration of actor is greater than 1, say "Ellis moves into posistion preparing to stike.";
		rule succeeds;
	if the actor is player:
		now the global actor is the actor;
		if the concentration of the actor is greater than 1, say "You move into posistion preparing to strike.";
		rule succeeds.

Lose concentration prose rule:
	if the concentration loser is the Tank:
		say "The Tank roars furiously! [run paragraph on]";
		rule succeeds;
	if the concentration loser is Rochelle:
		say "Rochelle groans trying to stand up. [run paragraph on]";
		rule succeeds;
	if the concentration loser is Coach:
		say "Coach groans trying to stand up. [run paragraph on]";
		rule succeeds;
	if the concentration loser is Ellis:
		say "Ellis groans trying to stand up. [run paragraph on]";
		rule succeeds;
	if the concentration loser is player:
		say "You groan trying to stand up. [run paragraph on]";
		rule succeeds;

Section - Other Reports

[parry]
Report an actor parrying (this is the do not report actor parry rule):
	if the actor is the Tank:
		rule succeeds;
	if the actor is player:
		rule succeeds;
	if the actor is a survivor:
		rule succeeds;
	if the actor is an infected:
		rule succeeds.

[dodging]
Report an actor dodging (this is the do not report actor dodge rule):
	if the actor is the Tank:
		rule succeeds;
	if the actor is player:
		rule succeeds;
	if the actor is a survivor:
		rule succeeds;
	if the actor is an infected:
		rule succeeds.
		
Section - AI

Standard AI action select rule (this is the Tank hate concentrating rule):
	choose row with an Option of the action of the global
		attacker concentrating in the Table of AI Combat Options;
	if the global attacker is a tank:
		decrease the Weight entry by 5.


Chapter - Commented out code

[There is a infected called common.]
[common is infected.]
[An infected called common is in Stage.] 
[The description is "a common infected.".]
[A common is a kind of infected is in Stage.]
[There are 10 common in Stage.]
[An infected called commons.]
[The Tank is hostile.]
[There is 10 infecteds called commons in Stage.]
[The Tank is an infected.]
[An infected called Tank is in Stage. ]
[A Tank is a kind of infected and is in Stage.]

[The standard attack roll rule is not listed in the basic attack roll rulebook.]

[A basic attack roll rule (this is the lucky 7s rule):
	if the numbers boolean is true, say "[italic type]Rolling ";
	change the to-hit roll to 7;
	if the numbers boolean is true, say the to-hit roll, "[run paragraph on]".]
	
		[repeat with z running through alive infected in location:
		if a random chance of 1 in 2 succeeds:
			now the health of z is the health of z minus 1;		
			say "[if the health of z is less than 1] This Infected got hit by aoe[otherwise][z] got hit by aoe, but still standing[end if].";
			if z is killed:
				now z is in Heaven;
				Fully heal z.]
[Every turn when a infected is dead and is visible: move infected to Heaven.]

[repeat with X running through all alive persons enclosed by the location:				
		if the initiative of X is less than -2, now the initiative of X is -2.]

	[if the health of infected is less than 0:
		move infected to Heaven;]
	[if the location of infected is Heaven:
		fully heal infected in Heaven;]

[First report an actor readying: if the actor is not player: stop the action]

[The melee of an infected has a dodge]
[An infected called horde is in stage.]
[A horde is usually hostile.]
[The health of horde is 2.]
[melee of horde is 1.]

				[say "[if global defender is at dodge][global defender] somehow managed to dodge the Tank's attack and keep moving.[otherwise]"]
				
	[if the player is not in Stage for at least 4 turns and an infected is in Heaven:
		if a random chance of 1 in 2 succeeds:
			say "An infected heard the noises and has entered the stage. [line break]";
			if location is not Safe Room:
				repeat with horde running from 1 to 5:
					move a random infected in Heaven to location;]
	[if Horde Wave is happening:]
	
				[say "[if global defender is at dodge][global defender] somehow managed to dodge the Tank's attack and keep moving.[otherwise]"]
				
[An attack move flavour rule:
	say "[The global attacker][if the global attacker is Tank]'s giant fists are about to[otherwise if the global attacker is the player]run towards[otherwise]is going to[end if]    [if global attacker is male]his[otherwise]her[end if]"]
	
[Report a survivor reloading:
	if the survivor is Rochelle:
		say "Rochelle: '[one of]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!'";
	rule succeeds;
	if the survivor is Coach:
		say "'Coach: [one of]Re-goddamn-loading[or]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!'";
	rule succeeds;
	if the actor is Ellis:
		say "Ellis: '[one of]I'm 'a reload[or]Hey, I'm reloading[or]Gotta reload[or]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!'";
	rule succeeds;]
	
[Damage modifiers rule:
	if the global attacker weapon is ak-47:
		increase the damage modifier by 2;
		if the numbers boolean is true:
			say " + 2 (ak-47)[run paragraph on]".]
			
[]
[		if the final damage is less than 2:
			say "The Tank's attack did minor damage to [global defender].";
			rule succeeds;
	otherwise:
			say "[if the player is at dodge]You barely dodged the attack![otherwise if the player is at parry][global defender] face the tank and run pass it.[otherwise]The hulking beast misses and roars in frustration[end if]";
		rule succeeds.]
[Note: Combatants can be at-normal, at-act, at-react, or at-reacted.]
		

	
[Report an actor reloading (this is the actor report reloading rule):
	if the actor is the Tank:
		now the global actor is the actor;
		say "The Tank grabs a giant chunk of Concrete from the ground.";
		[say "[if the current load time of the Concrete is the maximum load time of the Concrete]The Tank grabs a giant chunk of Concrete from the ground.[end if]";]
		rule succeeds;
	if the actor is the Rochelle:
		[now the global actor is the actor;]
		say "Rochelle: [one of]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!";
	rule succeeds;
	if the actor is Coach:
		say "Coach: [one of]Re-goddamn-loading[or]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!";
	rule succeeds;
	if the actor is Ellis:
		say "Ellis: [one of]I'm 'a reload[or]Hey, I'm reloading[or]Gotta reload[or]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!";
	rule succeeds;
	if the actor is player:
		say "[one of]Reloading here[or]Cover me, I'm reloading[or]RELOADING[at random]!";
	rule succeeds.]
[Higher goes first; increases when you don't attack]
[]

[The whether attacking begins rules
The preliminary results of attacking rules
The basic attack roll rules
The attack modifiers rules
The calculate results of the attack roll rules
The show results of the attack roll rules
The whether the attack hit rules
The immediate results of hitting rules
The basic damage roll rules
The damage modifiers rules
The calculate the final damage rules
The show the final damage rules
The aftereffects before flavour text rules
The flavour text rules
The aftereffect rules
The take away until attack circumstances rules
The final blow report rules]


	
[A damage modifiers rule (this is the dream warriors grow stronger rule):
	let conquests be the number of killed people;
	if conquests > 0:
		increase the damage modifier by conquests;
		if the numbers boolean is true, say " + [conquests] (slain Tanks)[run paragraph on]".]

[East of Stage is The Light.

Check going:
	if hate is present:
		take no time;
		say "Not until that thing is dealt with!" instead.]