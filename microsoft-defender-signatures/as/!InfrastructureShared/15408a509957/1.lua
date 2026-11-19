-- Threat: !InfrastructureShared
-- Name: 15408a509957
-- Type: 21

local l_0_0 = "c:\\Windows\\system32\\en-US\\iscsiexes.dll.mui"
if sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 504602719)
end
return mp.INFECTED
