-- Threat: !InfrastructureShared
-- Name: 5fd720e789eb
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
