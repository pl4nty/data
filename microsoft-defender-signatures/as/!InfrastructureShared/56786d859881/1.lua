-- Threat: !InfrastructureShared
-- Name: 56786d859881
-- Type: 21

if peattributes.isdriver and mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
