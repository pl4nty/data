-- Threat: !InfrastructureShared
-- Name: 18bd76bf1405b
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
