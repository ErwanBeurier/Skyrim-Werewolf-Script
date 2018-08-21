Scriptname AUTHOR_MODArchangelAliasScript Extends ReferenceAlias
{Part of AUTHOR' mod: MOD Follower. Made by StCooler.
Attach it to the Archangel alias. Enables to switch from their other form to their human form after the end of the battle.}


Spell Property HealSpell Auto
Actor SelfRef
Actor PlayerRef


Event OnInit()
	;Because I'm tired of using Self.foo and Game.GetPlayer().
	SelfRef = Self.GetActorReference()
	PlayerRef = Game.GetPlayer()
	; Debug.Notification("Bleed out state: " + SelfRef.GetNoBleedoutRecovery())
	; SelfRef.SetNoBleedoutRecovery(False)
EndEvent 


Event OnCombatStateChanged(Actor akTarget, Int aeCombatState)
	If aeCombatState == 0 && SelfRef.IsPlayerTeammate()
	; When the combat is over and the reference is an ally to the player, we transform it back to human. 
		(Self.GetOwningQuest() As AUTHOR_MODMainScript).TransformToHuman(SelfRef)
	EndIf 
EndEvent


Event OnEnterBleedout()
	; Strangely the Angel tends to be stuck in "bleeding out" state. 
	; This aims at correcting this.
	Utility.Wait(5)
	HealSpell.Cast(SelfRef, SelfRef)
	Utility.Wait(5)
	; SelfRef.RestoreActorValue("health", SelfRef.GetAV("health"))
	; (Self.GetOwningQuest() As AUTHOR_MODMainScript).TransformToHuman(SelfRef)
EndEvent