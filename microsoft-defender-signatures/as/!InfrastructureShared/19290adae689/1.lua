-- Threat: !InfrastructureShared
-- Name: 19290adae689
-- Type: 21

if mp.get_mpattribute("//SCPT:ShedShell_2743.B") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(MpCommon.RollingQueueCount, "ShedShell_2743")
if l_0_0 then
  return mp.CLEAN
end
if not mp.get_mpattribute("SCPT:ShedShell_2743.A") then
  return mp.CLEAN
end
local l_0_2 = {
  path = "%windir%\\system32\\svchost.exe",
  cmdline = "-k iissvcs"
}
local l_0_3 = MpCommon.ExpandEnvironmentVariables(l_0_2.path)
local l_0_4 = sysio.GetProcessFromFileName(l_0_3)
for l_0_5, l_0_6 in pairs(l_0_4 or {}) do
  local l_0_7 = string.format("pid:%d,ProcessStart:%d", l_0_6.pid, l_0_6.starttime)
  local l_0_8 = mp.GetProcessCommandLine(l_0_7)
  if l_0_8 and l_0_8:sub(-#l_0_2.cmdline) == l_0_2.cmdline then
    MpCommon.BmTriggerSigPropagate(l_0_7, "T1505.003", "2743_ShedLoader")
  end
end
local l_0_9 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_CNAME))
if l_0_9 and 0 < #l_0_9 then
  mp.ReportLowfi(l_0_9, 3624457134)
end
MpCommon.RollingQueueCreate("ShedShell_2743", 1, 60)
return mp.INFECTED
