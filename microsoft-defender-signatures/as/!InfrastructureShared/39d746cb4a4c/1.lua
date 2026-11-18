-- Threat: !InfrastructureShared
-- Name: 39d746cb4a4c
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
