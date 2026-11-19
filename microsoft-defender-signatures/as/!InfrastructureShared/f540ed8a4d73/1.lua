-- Threat: !InfrastructureShared
-- Name: f540ed8a4d73
-- Type: 21

if mp.getfilesize() > 50000 and mp.getfilesize() < 1000000 and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
