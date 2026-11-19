-- Threat: !InfrastructureShared
-- Name: 1954060d7e6d2
-- Type: 21

if mp.getfilesize() > 10000 and mp.getfilesize() < 50000 and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
