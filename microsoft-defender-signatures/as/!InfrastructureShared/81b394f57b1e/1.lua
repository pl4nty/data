local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
            L3_1 = this_sigattrlog
            L3_1 = L3_1[2]
            L3_1 = L3_1.matched
            if L3_1 then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[2]
              L3_1 = L3_1.utf8p2
              if L3_1 ~= nil then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[2]
                L3_1 = L3_1.utf8p2
                if L3_1 ~= "" then
                  goto lbl_69
                end
              end
            end
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_69::
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.utf8p1
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.utf8p2
L5_1 = this_sigattrlog
L5_1 = L5_1[2]
L5_1 = L5_1.utf8p2
L6_1 = SuspMacPathsToMonitor
L7_1 = L5_1
L8_1 = false
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
if L3_1 == L4_1 then
  L6_1 = SuspMacPathsToMonitor
  L7_1 = L3_1
  L8_1 = true
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = sysio
    L6_1 = L6_1.IsFileExists
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = bm
      L6_1 = L6_1.trigger_sig
      L7_1 = "SuspFileDropdHttp.C"
      L8_1 = L3_1
      L6_1(L7_1, L8_1)
    end
    L6_1 = TrackPidAndTechniqueBM
    L7_1 = "BM"
    L8_1 = "T1105"
    L9_1 = "CommandAndControl_IngressToolTransfer_SuspScriptUsingHttp"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
