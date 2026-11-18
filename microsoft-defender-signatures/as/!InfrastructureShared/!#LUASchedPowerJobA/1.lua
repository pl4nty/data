-- Threat: !InfrastructureShared
-- Name: !#LUA:SchedPowerJob.A
-- Type: 13
-- MpAttributes: SCPT:PowerShellJobFile

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "\\tasks\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
