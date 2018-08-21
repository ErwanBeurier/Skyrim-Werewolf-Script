Scriptname AUTHOR_MODAngelAliasScript Extends ReferenceAlias
{Part of AUTHOR' mod: MOD Follower. Made by StCooler.
Attach it to the Angel alias. Enables to switch from their other form to their human form after the end of the battle.}


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
	; When entering bleedout state, the angel transforms to an archangel. 
	Utility.Wait(5)
	(Self.GetOwningQuest() As AUTHOR_MODMainScript).TransformToArchangel(SelfRef)
EndEvent