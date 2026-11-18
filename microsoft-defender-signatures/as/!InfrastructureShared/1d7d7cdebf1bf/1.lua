-- Threat: !InfrastructureShared
-- Name: 1d7d7cdebf1bf
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
