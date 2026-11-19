-- Threat: !InfrastructureShared
-- Name: c3787b75ed3a
-- Type: 21

if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
