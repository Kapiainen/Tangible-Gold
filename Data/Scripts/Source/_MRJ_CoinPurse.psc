ScriptName _MRJ_CoinPurse Extends ObjectReference

Int Property iGoldAmount = 0 Auto
MiscObject Property kGold001 Auto

Form kGoldBase
Form kSelfBase

Event OnInit()
	kSelfBase = Self.GetBaseObject()
	If(SKSE.GetVersionRelease() >= 46)
		;SKSE 1.7.1 (rel 46) or higher required
		DefaultObjectManager kDefObjMan = Game.GetFormFromFile(0x00000031, "Skyrim.esm") as DefaultObjectManager
		kGoldBase = kDefObjMan.GetForm("GOLD")
	Else
		kGoldBase = kGold001
	EndIf
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	akNewContainer.AddItem(kGoldBase, iGoldAmount, False)
	akNewContainer.RemoveItem(kSelfBase, 1, True)
EndEvent