-- Threat: !InfrastructureShared
-- Name: 1dbd7b27a57a1
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
