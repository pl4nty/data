local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = GetPersistContextValueForKeyRegex
L1_1 = "NewServiceRegistered_LoadsBeforeAV"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = next
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = bm
    L1_1 = L1_1.add_related_string
    L2_1 = "NewMinifilterServiceRegistered"
    L3_1 = safeJsonSerialize
    L4_1 = L0_1
    L3_1 = L3_1(L4_1)
    L4_1 = bm
    L4_1 = L4_1.RelatedStringBMReport
    L1_1(L2_1, L3_1, L4_1)
  end
end
L1_1 = SetPersistContextNoPath
L2_1 = "SymLinkCreatedForMDE"
L3_1 = "AV"
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
