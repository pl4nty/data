-- Threat: !InfrastructureShared
-- Name: 35d7a1cdaf8a
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
