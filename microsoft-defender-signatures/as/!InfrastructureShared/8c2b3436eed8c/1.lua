local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = versioning
L1_1 = L1_1.GetMachineGuid
L1_1 = L1_1()
if L1_1 then
  L3_1 = L1_1
  L2_1 = L1_1.lower
  L2_1 = L2_1(L3_1)
  if L2_1 == "136df845-438e-4214-ba56-aa31d0a2e1f4" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L0_1
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L0_1 = L2_1
L2_1 = sysio
L2_1 = L2_1.IsFileExists
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = sysio
L2_1 = L2_1.GetFileLastWriteTime
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = sysio
L3_1 = L3_1.GetLastResult
L3_1 = L3_1()
L3_1 = L3_1.Success
if not L3_1 or L2_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1 / 10000000
L2_1 = L3_1 - 11644473600
L3_1 = MpCommon
L3_1 = L3_1.GetCurrentTimeT
L3_1 = L3_1()
if L2_1 >= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1 - L2_1
L4_1 = L4_1 / 60
L5_1 = L4_1 <= 20160
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.get_current_process_startup_info
L6_1 = L6_1()
L7_1 = bm
L7_1 = L7_1.request_SMS
L8_1 = L6_1.ppid
L9_1 = "H"
L7_1(L8_1, L9_1)
L7_1 = bm
L7_1 = L7_1.add_action
L8_1 = "SmsAsyncScanEvent"
L9_1 = 1000
L7_1(L8_1, L9_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
