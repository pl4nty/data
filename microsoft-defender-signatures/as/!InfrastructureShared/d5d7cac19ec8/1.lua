-- Threat: !InfrastructureShared
-- Name: d5d7cac19ec8
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
