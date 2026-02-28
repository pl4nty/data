local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1 = L2_1()
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\program files"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\activetraderpro"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    goto lbl_31
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_31::
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "ExecutedPENoCert"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = GetTaintLevelHR
L2_1 = L2_1()
if L2_1 == nil or L2_1 ~= "Medium" and L2_1 ~= "High" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsDetectionThresholdMet
L4_1 = "BM"
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = IsTacticObservedForPid
  L4_1 = "BM"
  L5_1 = "processinjection_target"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = IsTacticObservedForPid
    L4_1 = "BM"
    L5_1 = "discovery"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      goto lbl_72
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_72::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
