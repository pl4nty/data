-- Threat: !InfrastructureShared
-- Name: a078e80fa7f6
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
