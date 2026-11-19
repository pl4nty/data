-- Threat: !InfrastructureShared
-- Name: 45d7b8ec32a9
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
