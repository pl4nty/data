-- Threat: !InfrastructureShared
-- Name: 8d783a44e624
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
