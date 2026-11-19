-- Threat: !InfrastructureShared
-- Name: 43d75d7ea625
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
