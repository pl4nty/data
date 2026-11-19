-- Threat: !InfrastructureShared
-- Name: bdd71d4b80dd
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
