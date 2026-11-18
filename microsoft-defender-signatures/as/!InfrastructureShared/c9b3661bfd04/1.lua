-- Threat: !InfrastructureShared
-- Name: c9b3661bfd04
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
local l_0_2 = {
  "azure",
  "datadog",
  "splunk",
  "servicenow",
  "\\windows\\system32\\",
  "\\windows\\syswow64\\",
  "program files\\microsoft",
  "checkmk",
  "TaniumReceiver.exe",
  "SQLAGENT.EXE",
  "frontserver.exe",
  "launchpad.exe",
  "nssm.exe",
  "PythonService.exe",
  "agent.exe",
  "health_check.py"
}
if contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = l_0_3.image_path
local l_0_5 = {
  "\\windows\\system32\\",
  "\\windows\\syswow64\\",
  "TaniumReceiver.exe",
  "SQLAGENT.EXE",
  "frontserver.exe",
  "launchpad.exe",
  "nssm.exe",
  "PythonService.exe",
  "agent.exe",
  "checkmk"
}
if contains(l_0_4, l_0_5) then
  return mp.CLEAN
end
bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
if l_0_0.ppid then
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
end
bm.add_related_string("[->] COMMAND: ", l_0_0.command_line, bm.RelatedStringBMReport)
pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/SusMemExecs.MK!sms")
add_parents()
return mp.INFECTED
