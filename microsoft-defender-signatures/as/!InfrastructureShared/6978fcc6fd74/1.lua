-- Threat: !InfrastructureShared
-- Name: 6978fcc6fd74
-- Type: 21

if peattributes.isdriver and mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
