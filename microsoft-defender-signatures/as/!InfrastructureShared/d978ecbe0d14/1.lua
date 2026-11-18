-- Threat: !InfrastructureShared
-- Name: d978ecbe0d14
-- Type: 21

if peattributes.isdriver and mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
