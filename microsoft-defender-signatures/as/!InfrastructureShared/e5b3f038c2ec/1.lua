local L0_1, L1_1, L2_1, L3_1
L0_1 = is_excluded_parent_proc_auto
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = GetRealPidForScenario
L1_1 = "BM"
L0_1 = L0_1(L1_1)
L1_1 = AddResearchData
L2_1 = L0_1
L3_1 = true
L1_1(L2_1, L3_1)
L1_1 = IsTacticObservedForPid
L2_1 = L0_1
L3_1 = "ntdsexfil"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = IsTechniqueObservedForPid
  L2_1 = L0_1
  L3_1 = "T1140"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = IsTechniqueObservedForPid
L2_1 = L0_1
L3_1 = "T1047"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = IsTechniqueObservedForPid
  L2_1 = L0_1
  L3_1 = "T1021.006"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_45
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_45::
L1_1 = IsDetectionThresholdMet
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
