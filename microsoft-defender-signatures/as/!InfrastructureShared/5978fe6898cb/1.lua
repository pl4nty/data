-- Threat: !InfrastructureShared
-- Name: 5978fe6898cb
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
