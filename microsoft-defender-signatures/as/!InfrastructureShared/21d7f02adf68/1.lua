local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = IsTechniqueObservedForPid
  L2_1 = L0_1
  L3_1 = "ttexclusion"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_22
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_22::
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsCommandLineTracked
L3_1 = L1_1
L4_1 = "PersistenceRegistryPowershellBlock"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == true then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
