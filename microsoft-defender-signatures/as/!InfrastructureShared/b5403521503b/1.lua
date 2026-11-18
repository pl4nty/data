-- Threat: !InfrastructureShared
-- Name: b5403521503b
-- Type: 21

if mp.getfilesize() > 50000 and mp.getfilesize() < 1000000 and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
