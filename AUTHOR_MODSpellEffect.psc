Scriptname AUTHOR_MODSpellEffect extends ActiveMagicEffect  
{Script by StCooler, for AUTHOR' follower NPC.
Should be attached to the magic effect of the spell used to transform into their other form.
Uses the function of AUTHOR_MODMainScript. The caster should be the same as the one in the quest.}


Quest Property OtherFormTransformQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	(OtherFormTransformQuest As AUTHOR_MODMainScript).TransformToOtherForm(akCaster)
EndEvent

