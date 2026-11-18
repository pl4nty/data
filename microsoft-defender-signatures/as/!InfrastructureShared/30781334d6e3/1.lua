-- Threat: !InfrastructureShared
-- Name: 30781334d6e3
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
