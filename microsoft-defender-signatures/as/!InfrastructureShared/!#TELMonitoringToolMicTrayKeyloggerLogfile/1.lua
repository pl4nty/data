-- Threat: !InfrastructureShared
-- Name: !#TEL:MonitoringTool:MicTrayKeylogger:Logfile
-- Type: 13

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "\\public\\mictray.log") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
