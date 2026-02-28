local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = ""
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L1_1 = L1_1.utf8p2
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "Uri=([^;]+)"
L2_1 = L2_1(L3_1, L4_1)
L0_1 = L2_1
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L3_1 = bm
L3_1 = L3_1.request_SMS
L4_1 = L2_1.ppid
L5_1 = "H"
L3_1(L4_1, L5_1)
L3_1 = bm
L3_1 = L3_1.add_action
L4_1 = "SmsAsyncScanEvent"
L5_1 = 100
L3_1(L4_1, L5_1)
L3_1 = {}
L3_1.SIG_CONTEXT = "LummaC2_tempPath"
L3_1.CONTENT_SOURCE = "BM"
L3_1.TAG = "INTERFLOW"
L4_1 = mp
L4_1 = L4_1.CheckUrl
L5_1 = L0_1
L4_1, L5_1 = L4_1(L5_1)
if L4_1 == 1 and L5_1 == 1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = SafeGetUrlReputation
L7_1 = {}
L8_1 = L0_1
L7_1[1] = L8_1
L8_1 = L3_1
L9_1 = false
L10_1 = 2000
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
L7_1 = L6_1.urls
L7_1 = L7_1[L0_1]
if L7_1 then
  L7_1 = L6_1.urls
  L7_1 = L7_1[L0_1]
  L7_1 = L7_1.determination
  if L7_1 == 2 then
    L7_1 = L6_1.urls
    L7_1 = L7_1[L0_1]
    L7_1 = L7_1.confidence
    if 60 <= L7_1 then
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
