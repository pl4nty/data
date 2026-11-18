-- Threat: !InfrastructureShared
-- Name: 17878629c68bf
-- Type: 21

local l_0_0 = mp.getfilesize()
if 400000 < l_0_0 or l_0_0 < 5000 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
