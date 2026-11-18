-- Threat: !InfrastructureShared
-- Name: 787806287091
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 or 20000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
