local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1()
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "^c:\\"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "^\\\\"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\program files"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "ExecutedPENoCert"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L3_1 = TrackCustomPersistContextNameByPPID
L4_1 = "set"
L5_1 = L2_1.ppid
L6_1 = "MimikatzTrigger"
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.request_SMS
L4_1 = L2_1.ppid
L5_1 = "H"
L3_1(L4_1, L5_1)
L3_1 = bm
L3_1 = L3_1.add_action
L4_1 = "SmsAsyncScanEvent"
L5_1 = 1000
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
