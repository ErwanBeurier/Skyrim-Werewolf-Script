Scriptname AUTHOR_MODSpellArchangelEffect extends ActiveMagicEffect  
{Script by StCooler, for AUTHOR' follower NPC.
Should be attached to the magic effect of the spell used to transform into their Archangel form.
Uses the function of AUTHOR_MODMainScript. The caster should be the same as the one in the quest.}


Quest Property AngelTransformQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	(AngelTransformQuest As AUTHOR_MODMainScript).TransformToArchangel(akCaster)
EndEvent

