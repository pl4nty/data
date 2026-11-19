-- Threat: !InfrastructureShared
-- Name: 4578f4d6a0c2
-- Type: 21

local l_0_0 = mp.getfilesize()
if 10000000 < l_0_0 then
  return mp.CLEAN
end
if mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") or mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
return mp.INFECTED
