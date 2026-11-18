-- Threat: !InfrastructureShared
-- Name: 85d74ab6418b
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
