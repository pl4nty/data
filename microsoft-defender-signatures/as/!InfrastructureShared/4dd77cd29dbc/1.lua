-- Threat: !InfrastructureShared
-- Name: 4dd77cd29dbc
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
