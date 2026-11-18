-- Threat: !InfrastructureShared
-- Name: 77b333925e9b
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or next(l_0_0) == nil then
  return mp.CLEAN
end
if not l_0_0.commandline then
  return mp.CLEAN
end
if string.find(l_0_0.commandline, "svchost.exe -k GPSvcGroup", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
