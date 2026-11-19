-- Threat: !InfrastructureShared
-- Name: 15408ba4c2e0
-- Type: 21

local l_0_0 = "c:\\windows\\system32\\XblAuthManagers.dll.mui"
if sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 504602719)
end
return mp.INFECTED
