-- Threat: !InfrastructureShared
-- Name: 4c789ab6f68e
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
