-- Threat: !InfrastructureShared
-- Name: 185d7630b3ee8
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
