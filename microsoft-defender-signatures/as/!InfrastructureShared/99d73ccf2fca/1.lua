-- Threat: !InfrastructureShared
-- Name: 99d73ccf2fca
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
