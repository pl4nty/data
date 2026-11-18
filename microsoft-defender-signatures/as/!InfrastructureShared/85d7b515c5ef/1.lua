-- Threat: !InfrastructureShared
-- Name: 85d7b515c5ef
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
