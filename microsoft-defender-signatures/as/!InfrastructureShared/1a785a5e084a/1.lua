-- Threat: !InfrastructureShared
-- Name: 1a785a5e084a
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 200000 or 1000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
