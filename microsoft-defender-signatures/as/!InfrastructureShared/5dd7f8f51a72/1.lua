-- Threat: !InfrastructureShared
-- Name: 5dd7f8f51a72
-- Type: 21

if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
