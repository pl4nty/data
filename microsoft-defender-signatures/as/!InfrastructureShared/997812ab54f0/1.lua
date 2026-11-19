-- Threat: !InfrastructureShared
-- Name: 997812ab54f0
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
