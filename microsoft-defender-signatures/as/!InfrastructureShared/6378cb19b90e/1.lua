-- Threat: !InfrastructureShared
-- Name: 6378cb19b90e
-- Type: 21

if mp.get_mpattribute("SIGATTR:SelfDelCMD") then
  return mp.INFECTED
end
return mp.CLEAN
