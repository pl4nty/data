-- Threat: !InfrastructureShared
-- Name: 617873befa0c
-- Type: 21

local l_0_0 = "C:\\Windows\\en-US\\ielowutil.exe.mui"
if sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 1204405327)
end
return mp.INFECTED
