local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_21
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_21::
L3_1 = this_sigattrlog
L3_1 = L3_1[16]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[16]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[16]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      goto lbl_39
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_39::
L3_1 = this_sigattrlog
L3_1 = L3_1[16]
L3_1 = L3_1.utf8p1
L4_1 = sysio
L4_1 = L4_1.IsFileExists
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = SuspMacPathsToMonitor
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  L6_1 = true
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = TrackPidAndTechniqueBM
    L5_1 = "BM"
    L6_1 = "T1105"
    L7_1 = "CommandAndControl_IngressToolTransfer_Http.A"
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
