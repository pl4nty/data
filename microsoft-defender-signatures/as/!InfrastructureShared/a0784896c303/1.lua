-- Threat: !InfrastructureShared
-- Name: a0784896c303
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_isdriver") then
  return mp.CLEAN
end
return mp.INFECTED
