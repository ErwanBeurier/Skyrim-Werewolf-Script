# README

## What is this?

This repository contains the Papyrus scripts, for Skyrim (and Skyrim SE), that aim at making an NPC tranform into a first form (Angel), and second form (Archangel), when a certain condition is met (life below a certain threshold for example). 


## Mods that I know use this script 

None yet.

 
## How to use this


[TO BE UPDATED] 

First, you need to edit the names OF the files, and the names IN the files. 
 - AUTHOR should be replaced with the mod author's name
 - MOD should be replaced with the mod's name.
 
In the following, I will refer to the other form as a Werewolf, but it could be any other Actor reference (even a Mudcrab lol). 
 
How it works: 
 - Create an empty cell, disconnected from the world. Put your Werewolf follower here.
 - Create a quest, attach to it the script AUTHOR_MODMainScript
 - In that quest, create two aliases : the alias of your Follower (unique) + the alias of your Werewolf (reference to the one in the cell)
 - Give the alias of the follower the script AUTHOR_MODHumanAliasScript
 - Give the alias of the Werewold the script AUTHOR_MODFormAliasScript
 - Create a magic effect for a spell, attach to it AUTHOR_MODSpellEffect
 - Create a spell, put the magic effect in it
 - Create a package, UseMagic, and use this spell. Choose whatever conditions you like.
 - Give the package and the spell to the alias of your follower.
 
That should be it :-) 

