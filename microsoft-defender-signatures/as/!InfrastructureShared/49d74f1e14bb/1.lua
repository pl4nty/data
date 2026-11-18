-- Threat: !InfrastructureShared
-- Name: 49d74f1e14bb
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
