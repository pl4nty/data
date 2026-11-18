-- Threat: !InfrastructureShared
-- Name: ddd7d4010cc6
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
