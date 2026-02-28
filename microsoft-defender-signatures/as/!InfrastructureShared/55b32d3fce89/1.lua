local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\program files"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\netlogon\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\sysvol\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "/nologo "
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_47
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_47::
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
      goto lbl_78
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_78::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
