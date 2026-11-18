-- Threat: !InfrastructureShared
-- Name: !#ExclusionsTaskSchedCmd.A
-- Type: 13

local l_0_0 = mp.getfilename()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "manage bde", 1, true) or string.find(l_0_0, "hthd_psp script", 1, true) or string.find(l_0_0, "ukmc", 1, true) or string.find(l_0_0, "configmgr", 1, true) or string.find(l_0_0, "extraskriver", 1, true) or string.find(l_0_0, "automatic-device-join", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
