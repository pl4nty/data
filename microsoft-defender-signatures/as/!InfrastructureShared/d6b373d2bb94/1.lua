-- Threat: !InfrastructureShared
-- Name: d6b373d2bb94
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line or "")
local l_0_2 = ""
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 and l_0_3.image_path then
  l_0_2 = string.lower(l_0_3.image_path)
end
local l_0_4 = {
  "\\git\\usr\\bin\\sh.exe",
  "\\git\\bin\\bash.exe",
  "\\git\\usr\\bin\\bash.exe"
}
local l_0_5 = {
  "-enc",
  "-encodedcommand",
  "frombase64string",
  "-nop ",
  "-w hidden",
  "-windowstyle hidden",
  "-noprofile"
}
if not contains(l_0_2, l_0_4) or not contains(l_0_1, l_0_5) then
  return mp.CLEAN
end
bm.add_related_string("[->] AMSI-FAIL GIT-BASH LOADER: ", l_0_1, bm.RelatedStringBMReport)
bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
if l_0_0.ppid then
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailGitBashLoader.AM")
add_parents()
return mp.INFECTED
