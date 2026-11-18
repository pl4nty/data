-- Threat: !InfrastructureShared
-- Name: 207891d33d65
-- Type: 21

local l_0_0 = mp.getfilesize()
if 400000 < l_0_0 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
