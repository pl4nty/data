local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsPidExcluded
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsDetectionThresholdMet
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsTacticObservedForParents
  L4_1 = L0_1
  L5_1 = "remoteservice-target"
  L6_1 = 3
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if not L3_1 then
    L3_1 = IsTacticObservedForParents
    L4_1 = L0_1
    L5_1 = "exec_remotely_dropped_unsigned"
    L6_1 = 3
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if not L3_1 then
      L3_1 = IsTacticObservedForParents
      L4_1 = L0_1
      L5_1 = "processinjection_target"
      L6_1 = 3
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if not L3_1 then
        L3_1 = IsTacticObservedGlobal
        L4_1 = "susp_ransomware"
        L3_1 = L3_1(L4_1)
        if not L3_1 then
          goto lbl_79
        end
      end
    end
  end
end
L3_1 = AppendToRollingQueue
L4_1 = "BruteForceNetUse"
L5_1 = L2_1
L6_1 = L1_1
L7_1 = 3600
L3_1(L4_1, L5_1, L6_1, L7_1)
L3_1 = GetRollingQueueCount
L4_1 = "BruteForceNetUse"
L3_1 = L3_1(L4_1)
if 3 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_79::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
