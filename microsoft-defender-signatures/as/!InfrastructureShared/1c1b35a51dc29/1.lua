-- Threat: !InfrastructureShared
-- Name: 1c1b35a51dc29
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and next(l_0_0) and l_0_0.command_line then
  local l_0_1 = string.lower(l_0_0.command_line)
  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
  bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_0_1, bm.RelatedStringBMReport)
  bm.add_related_file(l_0_1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/SusImageFileOptions.MK")
add_parents()
return mp.INFECTED
