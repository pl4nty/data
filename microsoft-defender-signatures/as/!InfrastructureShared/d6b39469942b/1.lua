-- Threat: !InfrastructureShared
-- Name: d6b39469942b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if not l_0_1 or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.lower(l_0_0.command_line or "")
local l_0_3 = ""
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 and l_0_4.image_path then
  l_0_3 = string.lower(l_0_4.image_path)
end
local l_0_5 = contains(l_0_1, "\\sqlps.exe") or contains(l_0_3, {
  "\\sqlservr.exe",
  "\\sqlagent.exe"
})
if not l_0_5 then
  return mp.CLEAN
end
bm.add_related_string("[->] AMSI-FAIL SQL HOST: ", l_0_2, bm.RelatedStringBMReport)
bm_AddRelatedFileFromCommandLine(l_0_2, nil, nil, 1)
if l_0_0.ppid then
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailSqlHost.AM")
add_parents()
return mp.INFECTED
