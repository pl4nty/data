local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L2_1 = sysio
  L2_1 = L2_1.IsPathAVExcluded
  L3_1 = L1_1
  L4_1 = false
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:OfficeVBASkipKnownCleanOriginalFile"
    L2_1(L3_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
