-- Threat: !InfrastructureShared
-- Name: 1f7877c15122
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 3000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
