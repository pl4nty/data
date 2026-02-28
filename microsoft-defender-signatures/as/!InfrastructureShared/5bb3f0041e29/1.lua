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
L3_1 = bm
L3_1 = L3_1.get_connection_string
L3_1 = L3_1()
if L3_1 then
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L3_1
  L6_1 = "DestPort=(%d+)"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= nil and L4_1 ~= "" and L4_1 ~= "23" then
    L5_1 = TrackPidAndTechniqueBM
    L6_1 = "BM"
    L7_1 = "T1572"
    L8_1 = "CommandAndControl_ProtocolTunneling_TelnetoverNonStandardPort"
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
