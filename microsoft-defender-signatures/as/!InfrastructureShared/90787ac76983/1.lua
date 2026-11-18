-- Threat: !InfrastructureShared
-- Name: 90787ac76983
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
local l_0_0 = mp.getfilesize()
if 1000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
return mp.INFECTED
