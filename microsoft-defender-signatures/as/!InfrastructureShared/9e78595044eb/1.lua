-- Threat: !InfrastructureShared
-- Name: 9e78595044eb
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 4000000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
return mp.INFECTED
