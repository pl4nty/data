-- Threat: !InfrastructureShared
-- Name: 4b78680e7263
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if peattributes.ismsil == true and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
