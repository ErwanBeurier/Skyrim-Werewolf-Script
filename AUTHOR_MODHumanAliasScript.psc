Scriptname AUTHOR_MODHumanAliasScript extends ReferenceAlias
{Script by StCooler, for AUTHOR' follower NPC.
Should be attached to the reference alias Human follower that will transform into their other form.
Forces the human follower to re-evaluate its packages on each hit.}


Event OnHit(ObjectReference akAgressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	Self.GetActorReference().EvaluatePackage()
EndEvent