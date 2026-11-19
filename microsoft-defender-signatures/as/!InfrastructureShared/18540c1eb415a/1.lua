-- Threat: !InfrastructureShared
-- Name: 18540c1eb415a
-- Type: 21

if mp.getfilesize() > 10000 and mp.getfilesize() < 50000 and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
