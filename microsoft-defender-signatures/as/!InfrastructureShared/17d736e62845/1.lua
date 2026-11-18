-- Threat: !InfrastructureShared
-- Name: 17d736e62845
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
