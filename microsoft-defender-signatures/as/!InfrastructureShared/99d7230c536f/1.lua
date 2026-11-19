-- Threat: !InfrastructureShared
-- Name: 99d7230c536f
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
