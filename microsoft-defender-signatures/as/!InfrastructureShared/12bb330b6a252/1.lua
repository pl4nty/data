-- Threat: !InfrastructureShared
-- Name: 12bb330b6a252
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not (l_0_0 and next(l_0_0)) or not l_0_0.command_line then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
local l_0_3 = string.find(l_0_1, "gpsvc", 1, true) ~= nil
local l_0_5 = string.find(l_0_1, "schedule", 1, true) ~= nil
if l_0_3 and l_0_5 then
  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
  bm.add_related_file(l_0_1)
  bm.add_related_string("[->] MEDICATED SCRIPT: ", l_0_1, bm.RelatedStringBMReport)
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
  triggerMemoryScanOnProcessTree(true, false, "SMS_H", 5000, "Behavior:Win32/SusGPOUpdate.MK")
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
