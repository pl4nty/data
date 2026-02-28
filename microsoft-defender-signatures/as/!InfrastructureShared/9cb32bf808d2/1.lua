local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
  L3_1 = L3_1[4]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p1
    if L3_1 ~= nil and L3_1 ~= "" and L4_1 ~= nil and L4_1 ~= "" then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L3_1
      L7_1 = L4_1
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = "mac_scp_file_transfer"
        L6_1 = AppendToRollingQueue
        L7_1 = L5_1
        L8_1 = "file_transferred_path"
        L9_1 = L4_1
        L10_1 = 7200
        L11_1 = 100
        L12_1 = 0
        L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
        L6_1 = TrackPidAndTechniqueBM
        L7_1 = "BM"
        L8_1 = "T1105"
        L9_1 = "CommandAndControl_IngressToolTransfer_Rsync"
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
