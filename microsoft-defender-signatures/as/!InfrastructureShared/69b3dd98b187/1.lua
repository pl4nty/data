local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p2
        if L3_1 ~= nil then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L3_1 = L3_1.utf8p2
          if L3_1 ~= "" then
            goto lbl_54
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_54::
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.utf8p1
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.utf8p2
if L3_1 == L4_1 then
  L5_1 = SuspMacPathsToMonitor
  L6_1 = L3_1
  L7_1 = true
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = sysio
    L5_1 = L5_1.IsFileExists
    L6_1 = L3_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = bm
      L5_1 = L5_1.trigger_sig
      L6_1 = "SuspFileDropdHttp.B"
      L7_1 = L3_1
      L5_1(L6_1, L7_1)
    end
    L5_1 = TrackPidAndTechniqueBM
    L6_1 = "BM"
    L7_1 = "T1105"
    L8_1 = "CommandAndControl_IngressToolTransfer_UsingKoreanDomains"
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
