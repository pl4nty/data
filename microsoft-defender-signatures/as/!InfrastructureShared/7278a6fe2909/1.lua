-- Threat: !InfrastructureShared
-- Name: 7278a6fe2909
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.getfilesize() >= 3145728 then
  return mp.CLEAN
end
return mp.INFECTED
