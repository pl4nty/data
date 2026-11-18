-- Threat: !InfrastructureShared
-- Name: 51789eace7a1
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 600000 or 800000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
