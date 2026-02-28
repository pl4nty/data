local L0_1, L1_1, L2_1, L3_1
L0_1 = TrackPidAndTechnique
L1_1 = "CMDHSTR"
L2_1 = "T1562.001"
L3_1 = "wmic_def_excl"
L0_1(L1_1, L2_1, L3_1)
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = set_research_data
  L1_1 = "wmic_method"
  L2_1 = "add"
  L3_1 = false
  L0_1(L1_1, L2_1, L3_1)
else
  L0_1 = set_research_data
  L1_1 = "wmic_method"
  L2_1 = "set"
  L3_1 = false
  L0_1(L1_1, L2_1, L3_1)
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
