-- Threat: !InfrastructureShared
-- Name: bbd7e0d7c964
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
