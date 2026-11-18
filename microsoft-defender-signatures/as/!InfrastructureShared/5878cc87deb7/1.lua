-- Threat: !InfrastructureShared
-- Name: 5878cc87deb7
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
