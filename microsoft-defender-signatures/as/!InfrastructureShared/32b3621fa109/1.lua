local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p2
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = explode
  L3_2 = A0_2
  L4_2 = ","
  L2_2 = L2_2(L3_2, L4_2)
  A0_2 = L2_2
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L7_2 == "ProcessInfo" then
      L8_2 = {}
      L9_2 = sigattr_head
      L8_2.head = L9_2
      L9_2 = sigattr_tail
      L8_2.tail = L9_2
      L9_2 = bm
      L9_2 = L9_2.get_process_notifications
      L10_2 = A1_2.ppid
      L9_2 = L9_2(L10_2)
      L8_2.notifications = L9_2
      L8_2.startupInfo = A1_2
      L2_2.ProcessInfo = L8_2
    elseif L7_2 == "NetworkHistory" then
      L8_2 = {}
      L9_2 = bm
      L9_2 = L9_2.GetConnectionHistory
      L9_2 = L9_2()
      L8_2.history = L9_2
      L9_2 = bm
      L9_2 = L9_2.GetOverallTrafficVolumes
      L9_2 = L9_2()
      L8_2.volumes = L9_2
      L2_2.NetworkHistory = L8_2
    elseif L7_2 == "FastRemediation" then
      L8_2 = bm
      L8_2 = L8_2.trigger_sig
      L9_2 = "Heimdall_ProcessAction"
      L10_2 = "FastRemediation"
      L8_2(L9_2, L10_2)
    elseif L7_2 == "SlowRemediation" then
      L8_2 = bm
      L8_2 = L8_2.trigger_sig
      L9_2 = "Heimdall_ProcessAction"
      L10_2 = "SlowRemediation"
      L8_2(L9_2, L10_2)
    elseif L7_2 == "RequestSMS" then
      L8_2 = bm
      L8_2 = L8_2.request_SMS
      L9_2 = A1_2.ppid
      L10_2 = "l+"
      L8_2(L9_2, L10_2)
      L8_2 = bm
      L8_2 = L8_2.add_action
      L9_2 = "SmsAsyncScanEvent"
      L10_2 = 1000
      L8_2(L9_2, L10_2)
    elseif L7_2 == "ProcDump" then
      L8_2 = bm
      L8_2 = L8_2.GetPEBInfo
      L8_2 = L8_2()
      L9_2 = {}
      L9_2.PEB = L8_2
      L10_2 = MpCommon
      L10_2 = L10_2.Base64Encode
      L11_2 = bm
      L11_2 = L11_2.ReadProcMem
      L12_2 = L8_2.PEBAddr
      L13_2 = 2048
      L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2.data = L10_2
      L2_2.ProcDump = L9_2
    else
      L2_2[L7_2] = "unk"
    end
  end
  L3_2 = bm
  L3_2 = L3_2.add_related_string
  L4_2 = "SuspProcReport"
  L5_2 = safeJsonSerialize
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L6_2 = bm
  L6_2 = L6_2.RelatedStringBMReport
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = reportTimingData
  L3_2()
  L3_2 = add_parents
  L3_2()
  L3_2 = reportSessionInformation
  L3_2()
end

processActions = L2_1
L2_1 = pcall
L3_1 = processActions
L4_1 = L0_1
L5_1 = L1_1
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
if not L2_1 then
  L4_1 = pcall
  L5_1 = mp
  L5_1 = L5_1.GetUrlReputation
  L6_1 = {}
  L7_1 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
  L6_1[1] = L7_1
  L7_1 = safeJsonSerialize
  L8_1 = {}
  L8_1.error = L3_1
  L8_1.TAG = "NOLOOKUP"
  L7_1, L8_1 = L7_1(L8_1)
  L4_1(L5_1, L6_1, L7_1, L8_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
