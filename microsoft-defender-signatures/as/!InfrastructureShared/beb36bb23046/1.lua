local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[3]
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = isnull
L2_1 = L0_1.utf8p1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.utf8p2
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_25
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_25::
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1.utf8p1
L3_1 = "targetprocessppid:(%d+)"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetPPidFromPid
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.request_SMS
L4_1 = L2_1
L5_1 = "m"
L3_1(L4_1, L5_1)
L3_1 = bm
L3_1 = L3_1.add_action
L4_1 = "SmsAsyncScanEvent"
L5_1 = 1
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
