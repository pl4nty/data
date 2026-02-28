local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_SMS_level
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SMS_SCAN_LOW_ADV
L3_1 = mp
L3_1 = L3_1.SMS_SCAN_LOW
L2_1 = L2_1 - L3_1
L3_1 = mp
L3_1 = L3_1.bitand
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L2_1 == L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L3_1
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
L3_1 = L4_1
L4_1 = sysio
L4_1 = L4_1.IsFileExists
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = sysio
L4_1 = L4_1.GetFileLastWriteTime
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = sysio
L5_1 = L5_1.GetLastResult
L5_1 = L5_1()
L5_1 = L5_1.Success
if not L5_1 or L4_1 == 0 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L4_1 / 10000000
L4_1 = L5_1 - 11644473600
L5_1 = MpCommon
L5_1 = L5_1.GetCurrentTimeT
L5_1 = L5_1()
if L4_1 >= L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = L5_1 - L4_1
L6_1 = L6_1 / 60
L7_1 = L6_1 <= 20160
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = bm
L8_1 = L8_1.get_process_relationships
L8_1, L9_1 = L8_1()
if L9_1 ~= nil then
  L10_1 = ipairs
  L11_1 = L9_1
  L10_1, L11_1, L12_1 = L10_1(L11_1)
  for L13_1, L14_1 in L10_1, L11_1, L12_1 do
    L15_1 = L14_1.image_path
    if L15_1 ~= nil then
      L15_1 = L14_1.reason
      L16_1 = bm
      L16_1 = L16_1.RELATIONSHIP_INJECTION
      if L15_1 == L16_1 then
        L15_1 = bm
        L15_1 = L15_1.request_SMS
        L16_1 = L14_1.ppid
        L17_1 = "l+"
        L15_1(L16_1, L17_1)
        L15_1 = bm
        L15_1 = L15_1.add_action
        L16_1 = "SmsAsyncScanEvent"
        L17_1 = 1000
        L15_1(L16_1, L17_1)
        L15_1 = TrackPidAndTechniqueBM
        L16_1 = "BM"
        L17_1 = "T1055.002"
        L18_1 = "portable_executable_injection"
        L15_1(L16_1, L17_1, L18_1)
        L15_1 = mp
        L15_1 = L15_1.INFECTED
        return L15_1
      end
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
