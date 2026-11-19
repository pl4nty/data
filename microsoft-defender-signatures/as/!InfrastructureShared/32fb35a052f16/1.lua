-- Threat: !InfrastructureShared
-- Name: 32fb35a052f16
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.command_line then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line:lower()
bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
bm.request_SMS(l_0_0.ppid, "h+")
bm.add_action("SmsAsyncScanEvent", 1)
bm.add_related_string("[->] PAYLOAD: ", l_0_1, bm.RelatedStringBMReport)
bm.add_related_file(l_0_1)
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AzureHound.A")
add_parents()
return mp.INFECTED
