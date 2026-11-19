-- Threat: !InfrastructureShared
-- Name: 9978ab2be7a5
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
