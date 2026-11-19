-- Threat: !InfrastructureShared
-- Name: f778e199d50e
-- Type: 21

if peattributes.ismsil == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
