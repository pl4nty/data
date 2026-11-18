-- Threat: !InfrastructureShared
-- Name: afd70af8f1a5
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
