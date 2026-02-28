local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = MpCommon
L0_1 = L0_1.NidSearch
L1_1 = mp
L1_1 = L1_1.NID_ENABLE_EXTENDED_BAFS
L2_1 = 6
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 == true and L1_1 == "#E5EmergencyAntiTampering" then
  L2_1 = set_research_data
  L3_1 = "E5EmergencyAntiTampering"
  L4_1 = "true"
  L5_1 = false
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = MpCommon
L2_1 = L2_1.NidSearch
L3_1 = mp
L3_1 = L3_1.NID_ENABLE_EXTENDED_BAFS
L4_1 = 3
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = set_research_data
  L3_1 = "AggressivePeTrigger"
  L4_1 = "true"
  L5_1 = false
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
