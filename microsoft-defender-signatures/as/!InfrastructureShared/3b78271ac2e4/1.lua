-- Threat: !InfrastructureShared
-- Name: 3b78271ac2e4
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") or peattributes.isdll then
  return mp.CLEAN
end
if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
