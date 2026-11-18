-- Threat: !InfrastructureShared
-- Name: 9cb34c01f08f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = GetRollingQueueKeys("Trojan:Win32/BruteRatel.AM")
if l_0_0 then
  local l_0_1 = bm.get_current_process_startup_info()
  if not l_0_1 or not l_0_1.command_line then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1.command_line:lower()
  bm_AddRelatedFileFromCommandLine(l_0_2, nil, nil, 1)
  bm.request_SMS(l_0_1.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
  bm.add_related_string("[->] PAYLOAD: ", l_0_2, bm.RelatedStringBMReport)
  bm.add_related_file(l_0_2)
  triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/BruteRatel.AM!sms")
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
