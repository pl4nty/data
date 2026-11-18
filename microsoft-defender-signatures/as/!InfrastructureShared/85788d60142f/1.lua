-- Threat: !InfrastructureShared
-- Name: 85788d60142f
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
