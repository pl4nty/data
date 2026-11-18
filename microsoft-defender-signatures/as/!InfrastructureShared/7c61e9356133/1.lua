-- Threat: !InfrastructureShared
-- Name: 7c61e9356133
-- Type: 21

if peattributes.isdriver and mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
