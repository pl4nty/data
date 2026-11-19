-- Threat: !InfrastructureShared
-- Name: 8f78ae3b4a80
-- Type: 21

if mp.get_mpattribute("SIGATTR:SelfDelCMD") then
  return mp.INFECTED
end
return mp.CLEAN
