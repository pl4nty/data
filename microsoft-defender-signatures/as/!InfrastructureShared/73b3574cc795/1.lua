local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
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
    goto lbl_26
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_26::
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      goto lbl_44
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_44::
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.utf8p1
L4_1 = this_sigattrlog
L4_1 = L4_1[3]
L4_1 = L4_1.utf8p2
L5_1 = tonumber
L6_1 = string
L6_1 = L6_1.match
L7_1 = L4_1
L8_1 = "oldmtime=(%d+);"
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L6_1(L7_1, L8_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L6_1 = tonumber
L7_1 = string
L7_1 = L7_1.match
L8_1 = L4_1
L9_1 = "newmtime=(%d+);"
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L7_1(L8_1, L9_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L7_1 = L5_1 - L6_1
L7_1 = L7_1 / 3600000
if 4 < L7_1 then
  L8_1 = bm
  L8_1 = L8_1.get_imagepath
  L8_1 = L8_1()
  if L8_1 == nil then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = "BM"
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L8_1
  L12_1 = "/touch"
  L13_1 = -6
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 then
    L10_1 = mp
    L10_1 = L10_1.GetParentProcInfo
    L10_1 = L10_1()
    if L10_1 ~= nil then
      L11_1 = L10_1.ppid
      if L11_1 ~= nil then
        L9_1 = L10_1.ppid
      end
    end
  end
  if L9_1 == "BM" then
    L10_1 = bm
    L10_1 = L10_1.trigger_sig
    L11_1 = "MacTimeStompToPast"
    L12_1 = L3_1
    L10_1(L11_1, L12_1)
  else
    L10_1 = bm
    L10_1 = L10_1.trigger_sig
    L11_1 = "MacTimeStompToPast"
    L12_1 = L3_1
    L13_1 = L9_1
    L10_1(L11_1, L12_1, L13_1)
  end
  L10_1 = TrackPidAndTechniqueBM
  L11_1 = "BM"
  L12_1 = "T1070.006"
  L13_1 = "DefenseEvasion_IndicatorRemoval_MacTimeStompToPast"
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
