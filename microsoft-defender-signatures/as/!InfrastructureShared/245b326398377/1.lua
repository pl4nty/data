local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "\\asppc.exe"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\\ecomppc.exe"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    goto lbl_33
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_33::
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "^[^%l]?([a-z]):\\"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.byte
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L4_1 = string
L4_1 = L4_1.byte
L5_1 = "a"
L4_1 = L4_1(L5_1)
L3_1 = L3_1 - L4_1
if L3_1 == nil or L3_1 < 0 or 26 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = sysio
L4_1 = L4_1.GetLogicalDriveType
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 ~= 4 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = TrackPidAndTechniqueBM
L6_1 = L0_1.ppid
L7_1 = "T1021.002"
L8_1 = "exec_from_remoteshare"
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
