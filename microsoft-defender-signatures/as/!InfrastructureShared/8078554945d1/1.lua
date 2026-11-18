-- Threat: !InfrastructureShared
-- Name: 8078554945d1
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 3000000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
return mp.INFECTED
