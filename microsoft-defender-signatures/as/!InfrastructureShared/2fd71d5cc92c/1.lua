local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L1_1, L2_1 = L1_1(L2_1)
if L1_1 and L2_1 ~= nil then
  L0_1 = L2_1.ppid
end
if L0_1 ~= nil then
  L3_1 = IsPidExcluded
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = IsTacticObservedForPid
  L4_1 = L0_1
  L5_1 = "processinjection"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.LOWFI
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.GetScannedPPID
L3_1 = L3_1()
if L3_1 ~= "" and L3_1 ~= nil then
  L4_1 = IsTacticObservedForPid
  L5_1 = L3_1
  L6_1 = "processinjection_target"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.LOWFI
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
