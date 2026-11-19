-- Threat: !InfrastructureShared
-- Name: 32b3621fa109
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = bm.get_current_process_startup_info()

function processActions(l_1_0, l_1_1)
  l_1_0 = explode(l_1_0, ",")
  local l_1_2 = {}
  for l_1_3, l_1_4 in ipairs(l_1_0) do
    if l_1_4 == "ProcessInfo" then
      l_1_2.ProcessInfo = {
        head = sigattr_head,
        tail = sigattr_tail,
        notifications = bm.get_process_notifications(l_1_1.ppid),
        startupInfo = l_1_1
      }
    elseif l_1_4 == "NetworkHistory" then
      l_1_2.NetworkHistory = {
        history = bm.GetConnectionHistory(),
        volumes = bm.GetOverallTrafficVolumes()
      }
    elseif l_1_4 == "FastRemediation" then
      bm.trigger_sig("Heimdall_ProcessAction", "FastRemediation")
    elseif l_1_4 == "SlowRemediation" then
      bm.trigger_sig("Heimdall_ProcessAction", "SlowRemediation")
    elseif l_1_4 == "RequestSMS" then
      bm.request_SMS(l_1_1.ppid, "l+")
      bm.add_action("SmsAsyncScanEvent", 1000)
    elseif l_1_4 == "ProcDump" then
      local l_1_5 = bm.GetPEBInfo()
      l_1_2.ProcDump = {
        PEB = l_1_5,
        data = MpCommon.Base64Encode(bm.ReadProcMem(l_1_5.PEBAddr, 2048))
      }
    else
      l_1_2[l_1_4] = "unk"
    end
  end
  bm.add_related_string("SuspProcReport", safeJsonSerialize(l_1_2), bm.RelatedStringBMReport)
  reportTimingData()
  add_parents()
  reportSessionInformation()
end

local l_0_2, l_0_3 = pcall(processActions, l_0_0, l_0_1)
if not l_0_2 then
  pcall(mp.GetUrlReputation, {
    "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
  }, safeJsonSerialize({error = l_0_3, TAG = "NOLOOKUP"}))
end
return mp.INFECTED
