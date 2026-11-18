-- Threat: !InfrastructureShared
-- Name: 7540cc2c8e9a
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") or peattributes.isexe == false then
  return mp.CLEAN
end
return mp.INFECTED
