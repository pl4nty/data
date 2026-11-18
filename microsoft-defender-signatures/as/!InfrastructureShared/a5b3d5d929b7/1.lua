-- Threat: !InfrastructureShared
-- Name: a5b3d5d929b7
-- Type: 21

local l_0_0 = "system32\\shell32.dll"
local l_0_1 = mp.ContextualExpandEnvironmentVariables("%temp%\\") .. l_0_0
local l_0_2 = mp.ContextualExpandEnvironmentVariables("%temp%\\low\\") .. l_0_0
if sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
  mp.ReportLowfi(l_0_1 .. "\000", 1695212180)
end
if sysio.IsFileExists(l_0_2) then
  bm.add_related_file(l_0_2)
  mp.ReportLowfi(l_0_2 .. "\000", 1695212180)
end
return mp.INFECTED
