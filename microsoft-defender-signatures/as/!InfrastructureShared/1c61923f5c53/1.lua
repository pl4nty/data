-- Threat: !InfrastructureShared
-- Name: 1c61923f5c53
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
