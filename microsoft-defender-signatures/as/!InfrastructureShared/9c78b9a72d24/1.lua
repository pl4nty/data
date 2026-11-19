-- Threat: !InfrastructureShared
-- Name: 9c78b9a72d24
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 1000000 then
  return mp.CLEAN
end
return mp.INFECTED
