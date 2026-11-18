-- Threat: !InfrastructureShared
-- Name: 177800812033
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 29000 or mp.getfilesize() > 40000 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if peattributes.isdriver then
  return mp.INFECTED
end
return mp.CLEAN
