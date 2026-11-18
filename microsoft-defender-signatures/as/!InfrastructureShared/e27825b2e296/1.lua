-- Threat: !InfrastructureShared
-- Name: e27825b2e296
-- Type: 21

if peattributes.isdriver and mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
