-- Threat: !InfrastructureShared
-- Name: 75401d790ff4
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") or peattributes.isexe == false then
  return mp.CLEAN
end
return mp.INFECTED
