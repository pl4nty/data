local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "DestIp=([^;]*);"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = isPrivateIP
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L3_1
L7_1 = "Uri=([^;]*);"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil or L5_1 == "" then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.match
L7_1 = L5_1
L8_1 = "://([^/:]+)"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 == L4_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = TrackPidAndTechniqueBM
L8_1 = "BM"
L9_1 = "T1071.001"
L10_1 = "CommandAndControl_ApplicationLayerProtocol_WebProtocols"
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
