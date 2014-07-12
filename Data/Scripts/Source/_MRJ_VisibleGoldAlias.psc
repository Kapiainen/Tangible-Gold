Scriptname _MRJ_VisibleGoldAlias extends ReferenceAlias

Actor Property PlayerRef Auto
MiscObject Property Gold001 Auto
MiscObject Property kFakeGold Auto
Form kRealGold

Float fGoldWeight = 0.0

Event OnInit()
	OnPlayerLoadGame()
	Self.AddInventoryEventFilter(kFakeGold)
EndEvent

Event OnPlayerLoadGame()
	UnregisterForAllMenus()
	RegisterForMenu("InventoryMenu")
	If(SKSE.GetVersionRelease() >= 46)
		;SKSE 1.7.1 (rel 46) or higher required
		DefaultObjectManager kDefObjMan = Game.GetFormFromFile(0x00000031, "Skyrim.esm") as DefaultObjectManager
		kRealGold = kDefObjMan.GetForm("GOLD")
		kFakeGold.SetWorldModelPath(kRealGold.GetWorldModelPath())
		Int iLimit = kRealGold.GetWorldModelNumTextureSets()
		Int i = 0
		While(i < iLimit)
			TextureSet kTXST = kRealGold.GetWorldModelNthTextureSet(i)
			If(kTXST)
				kFakeGold.SetWorldModelNthTextureSet(kTXST, i)
			EndIf
			i += 1
		EndWhile
	Else
		kRealGold = Gold001
	EndIf
	fGoldWeight = kRealGold.GetWeight()
	String sGoldName = kRealGold.GetName()
	If(sGoldName != "gold")
		kFakeGold.SetName(sGoldName)
	EndIf
	kFakeGold.SetWeight(fGoldWeight)
	kFakeGold.SetGoldValue(kRealGold.GetGoldValue())
EndEvent

Event OnMenuOpen(string menuName)
	kRealGold.SetWeight(0.0)
	PlayerRef.AddItem(kFakeGold, PlayerRef.GetItemCount(kRealGold), True)
	GoToState("")
EndEvent

Event OnMenuClose(string menuName)
	GoToState("NotInMenu")
	kRealGold.SetWeight(fGoldWeight)
	PlayerRef.RemoveItem(kFakeGold, PlayerRef.GetItemCount(kFakeGold), True)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	PlayerRef.DropObject(kRealGold, aiItemCount)
	PlayerRef.AddItem(kRealGold, 1, True)
	PlayerRef.RemoveItem(kRealGold, 1, True)
EndEvent

State NotInMenu
	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	EndEvent
EndState