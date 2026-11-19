-- Threat: !InfrastructureShared
-- Name: 93d705acc12a
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
