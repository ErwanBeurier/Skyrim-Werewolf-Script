Scriptname AUTHOR_MODMainScript extends Quest
{Part of AUTHOR' mod: NPC OtherForm Follower. Made by StCooler.
Contains the functions to turn a human to a OtherForm monster and then back to human. The trick is that the OtherForm monster and the actor are switched.}

ReferenceAlias Property HumanRef Auto
{The human concerned by the transformation.}
ReferenceAlias Property OtherFormRef Auto
{The OtherForm that will be summoned when the spell is cast.}
ObjectReference Property StorageCellCOCMarker Auto
{The location in which the actual OtherForm is stored.}
ObjectReference Property HumanLocationXMarker Auto
{The location where the human is. It's teleported where the human/OtherForm is (depending on their state) and then we teleport the next state (OtherForm/human). Without this, their is a collision and the actor seems to suffer an offset (collision between both actors). Well, I don't know how to explain this.}
Spell Property ExplosionSpell Auto
{An explosion to hide the transformation.}
Float Property TimeBeforeBackToHuman Auto
{The time (in seconds) to wait before getting back to human form after the end of a combat.}



Function TransformToOtherForm(Actor akTarget)
	
	If akTarget == HumanRef.GetActorRef()		
		RandomExplosion(HumanRef.GetActorRef())
		OtherFormRef.GetActorRef().ResetHealthAndLimbs()
		HumanLocationXMarker.MoveTo(HumanRef.GetActorRef())
		HumanRef.GetActorRef().SetRestrained(True)
		HumanRef.GetActorRef().SetAlpha(0)
		HumanRef.GetActorRef().MoveTo(StorageCellCOCMarker)	
		OtherFormRef.GetActorRef().MoveTo(HumanLocationXMarker)
		OtherFormRef.GetActorRef().SetPlayerTeammate()
	EndIf
	
EndFunction


Function TransformToHuman(Actor akTarget)

	If akTarget == OtherFormRef.GetActorRef()
		Utility.wait(TimeBeforeBackToHuman)
		RandomExplosion(OtherFormRef.GetActorRef())
		OtherFormRef.GetActorRef().ResetHealthAndLimbs()
		OtherFormRef.GetActorRef().SetPlayerTeammate(False)
		HumanLocationXMarker.MoveTo(OtherFormRef.GetActorRef())
		OtherFormRef.GetActorRef().MoveTo(StorageCellCOCMarker)	
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