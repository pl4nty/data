-- Threat: !InfrastructureShared
-- Name: 307869dc6c09
-- Type: 21

if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 100000 or 150000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
