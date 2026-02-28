local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[18]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[18]
end
L1_1 = this_sigattrlog
L1_1 = L1_1[19]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[19]
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1.utf8p1
L3_1 = "imagename:(.+);targetprocessppid:(%d+):"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L3_1
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.GetPPidFromPid
L6_1 = L2_1
L5_1 = L5_1(L6_1)
L6_1 = bm
L6_1 = L6_1.add_related_process
L7_1 = L5_1
L6_1(L7_1)
L6_1 = sysio
L6_1 = L6_1.IsFileExists
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.IsKnownFriendlyFile
  L7_1 = L4_1
  L8_1 = true
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if not L6_1 then
    L6_1 = bm
    L6_1 = L6_1.add_related_file
    L7_1 = L4_1
    L6_1(L7_1)
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "SUSPICIOUS PATH: "
    L8_1 = L1_1
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = bm
    L6_1 = L6_1.request_SMS
    L7_1 = L5_1
    L8_1 = "h+"
    L6_1(L7_1, L8_1)
    L6_1 = bm
    L6_1 = L6_1.add_action
    L7_1 = "SmsAsyncScanEvent"
    L8_1 = 1
    L6_1(L7_1, L8_1)
    L6_1 = AppendToRollingQueue
    L7_1 = "AMSIpatch"
    L8_1 = "Amsi"
    L9_1 = "1"
    L10_1 = 86400
    L6_1(L7_1, L8_1, L9_1, L10_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
