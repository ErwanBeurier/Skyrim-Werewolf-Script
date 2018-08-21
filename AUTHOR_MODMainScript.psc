Scriptname AUTHOR_MODMainScript extends Quest
{Part of AUTHOR' mod: NPC Angel Follower. Made by StCooler.
Contains the functions to turn a human to an Angel and then back to human. The trick is that the Angel and the actor are switched.}

ReferenceAlias Property HumanRef Auto
{The human concerned by the transformation.}
ReferenceAlias Property AngelRef Auto
{The Angel that will be summoned when the spell is cast.}
ReferenceAlias Property ArchangelRef Auto
{The Archangel that will be summoned when the spell is cast.}
ObjectReference Property StorageCellCOCMarker Auto
{The location in which the actual Angel and Archangel are stored.}
ObjectReference Property HumanLocationXMarker Auto
{The location where the human is. It's teleported where the human/Angel/Archangel is (depending on their state) and then we teleport the next state (Angel/human). Without this, there is a collision and the actor seems to suffer an offset (collision between both actors).}
Spell Property ExplosionSpell Auto
{An explosion to hide the transformation.}
Float Property TimeBeforeBackToHuman Auto
{The time (in seconds) to wait before getting back to human form after the end of a combat.}






Function TransformToArchangel(Actor akTarget)
	
	If akTarget == AngelRef.GetActorRef()		
		; Random explosion that hides the transformation. 
		RandomExplosion(AngelRef.GetActorRef())
		
		; Resets the health of the next form, just in case. 
		ArchangelRef.GetActorRef().ResetHealthAndLimbs()
		
		; Removes the AngelRef from the teammate list, to prevent him from 
		; following the player.
		AngelRef.GetActorRef().SetPlayerTeammate(False)
		
		; Moves an XMarker at the feet of the AngelRef, to prevent collision.
		HumanLocationXMarker.MoveTo(AngelRef.GetActorRef())
		
		; No need to hide the AngelRef. We just move it to the storage room. 
		; AngelRef.GetActorRef().SetRestrained(True)
		; AngelRef.GetActorRef().SetAlpha(0)
		AngelRef.GetActorRef().MoveTo(StorageCellCOCMarker)	
		
		; Teleports the Archangel where the Angel was. 
		ArchangelRef.GetActorRef().MoveTo(HumanLocationXMarker)
		ArchangelRef.GetActorRef().SetPlayerTeammate()
	EndIf
	
EndFunction



Function TransformToAngel(Actor akTarget)
	
	If akTarget == HumanRef.GetActorRef()
		; Random explosion that hides the transformation. 
		RandomExplosion(HumanRef.GetActorRef())
		
		; Resets the health of the next form, just in case. 
		AngelRef.GetActorRef().ResetHealthAndLimbs()
		
		; Moves an XMarker at the feet of the HumanRef, to prevent collision.
		HumanLocationXMarker.MoveTo(HumanRef.GetActorRef())
		
		; Hides the HumanRef before moving it, to prevent him from getting 
		; back to the player.
		HumanRef.GetActorRef().SetRestrained(True)
		HumanRef.GetActorRef().SetAlpha(0)
		HumanRef.GetActorRef().MoveTo(StorageCellCOCMarker)
		
		; Teleports the AngelRef where the Human was. 
		AngelRef.GetActorRef().MoveTo(HumanLocationXMarker)
		AngelRef.GetActorRef().SetPlayerTeammate()
	EndIf
	
EndFunction



Function TransformToHuman(Actor akTarget)

	If akTarget == AngelRef.GetActorRef() || akTarget == ArchangelRef.GetActorRef() 
		; Wait a minute before transforming back. 
		Utility.wait(TimeBeforeBackToHuman)
		
		; Random explosion that hides the transformation. 
		RandomExplosion(akTarget)
		
		; Resets the health of the next form, just in case. 
		akTarget.ResetHealthAndLimbs()
		
		; Removes the AngelRef or ArchangelRef from the teammate list. 
		akTarget.SetPlayerTeammate(False)
		
		; Moves an XMarker at the feet of the AngelRef, to prevent collision.
		HumanLocationXMarker.MoveTo(akTarget)
		
		; Moves the Angel/Archangel to its storage cell.
		akTarget.MoveTo(StorageCellCOCMarker)
		
		; Teleports back the human form. 
		HumanRef.GetActorRef().MoveTo(HumanLocationXMarker)
		HumanRef.GetActorRef().ResetHealthAndLimbs()
		HumanRef.GetActorRef().SetRestrained(False)
		HumanRef.GetActorRef().SetAlpha(1)
	EndIf
	
EndFunction



Function RandomExplosion(Actor akTarget)
{Not at random, because I'm lazy.}

	ExplosionSpell.Cast(akTarget)
	
EndFunction