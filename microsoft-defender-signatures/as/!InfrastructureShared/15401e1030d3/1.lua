-- Threat: !InfrastructureShared
-- Name: 15401e1030d3
-- Type: 21

local l_0_0 = "c:\\Windows\\System32\\en-US\\appmgmt.dll.mui"
if sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 504602719)
end
return mp.INFECTED
