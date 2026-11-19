-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win64/MarsSnake.A!dha
-- Type: 9

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil and l_0_0.OriginalFilename == "ReportingEvents.db" and l_0_0.FileDescription == "the Event Logging API to report and view events" then
  return mp.INFECTED
end
return mp.CLEAN
