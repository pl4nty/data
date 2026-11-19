-- Threat: !InfrastructureShared
-- Name: 76784a1fa831
-- Type: 21

local l_0_0 = "C:\\Windows\\Media\\Alarm00.wav"
if sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 3364434415)
end
return mp.INFECTED
