local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetImagePathFromPid
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 <= 4) then
    goto lbl_21
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_21::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L1_1
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsKeyInRollingQueue
L4_1 = "BmProcessSearchOrderHijackA"
L5_1 = L2_1
L6_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = GetRealPidForScenario
  L4_1 = "CMDHSTR"
  L3_1 = L3_1(L4_1)
  L4_1 = IsTacticObservedForPid
  L5_1 = L3_1
  L6_1 = "simtool_childproc"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = IsTacticObservedForParents
    L5_1 = L3_1
    L6_1 = "simtool_childproc"
    L7_1 = 3
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if not L4_1 then
      goto lbl_59
    end
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_59::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
