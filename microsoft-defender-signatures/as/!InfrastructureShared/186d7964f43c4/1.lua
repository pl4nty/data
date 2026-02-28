local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
L1_1 = IsPidExcluded
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1.image_path
  L2_1 = L2_1(L3_1)
  L3_1 = #L2_1
  if 54 < L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "microsoft.office.datacenter.torus.powershellworker.exe$"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
L2_1 = IsDetectionThresholdMet
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = IsTacticObservedForParents
  L3_1 = L0_1
  L4_1 = "remoteservice-target"
  L5_1 = 3
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if not L2_1 then
    L2_1 = IsTacticObservedForParents
    L3_1 = L0_1
    L4_1 = "exec_remotely_dropped_unsigned"
    L5_1 = 3
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if not L2_1 then
      goto lbl_54
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_54::
L2_1 = IsTacticObservedGlobal
L3_1 = "susp_ransomware"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
