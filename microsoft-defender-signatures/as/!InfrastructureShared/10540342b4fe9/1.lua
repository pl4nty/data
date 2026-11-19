-- Threat: !InfrastructureShared
-- Name: 10540342b4fe9
-- Type: 21

if mp.getfilesize() > 50000 and mp.getfilesize() < 1000000 and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
