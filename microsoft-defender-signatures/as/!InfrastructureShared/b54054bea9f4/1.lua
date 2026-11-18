-- Threat: !InfrastructureShared
-- Name: b54054bea9f4
-- Type: 21

local l_0_0 = mp.getfilesize()
if 5000 < l_0_0 and l_0_0 < 1000000 and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.INFECTED
end
return mp.CLEAN
