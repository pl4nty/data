-- Threat: !InfrastructureShared
-- Name: 9dd74f679c42
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
