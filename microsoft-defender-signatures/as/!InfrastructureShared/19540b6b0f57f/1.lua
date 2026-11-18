-- Threat: !InfrastructureShared
-- Name: 19540b6b0f57f
-- Type: 21

if mp.getfilesize() > 10000 and mp.getfilesize() < 50000 and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
