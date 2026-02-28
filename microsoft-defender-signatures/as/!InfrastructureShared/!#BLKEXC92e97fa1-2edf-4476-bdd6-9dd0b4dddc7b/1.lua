local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_INMEMORY
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = GetCtxOfficeProc
L0_1 = L0_1()
if L0_1 ~= "productivity" and L0_1 ~= "productivity2" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = GetNonVfoScannedFilePathIfExistOnMachine
L2_1 = L2_1()
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.IsPathExcludedForHipsRule
  L3_1 = L1_1
  L4_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = nil
L3_1 = GetInvolvedFileInCmdLnIfExistOnMachine
L3_1 = L3_1()
L2_1 = L3_1
if L2_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.IsPathExcludedForHipsRule
  L4_1 = L2_1
  L5_1 = "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
