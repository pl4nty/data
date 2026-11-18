-- Threat: !InfrastructureShared
-- Name: 597869f1018c
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_isdriver") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 10000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
return mp.INFECTED
