-- Threat: !InfrastructureShared
-- Name: 162615c8d2abe
-- Type: 21

if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_0 = mp.getfilesize()
  if 3000000 < l_0_0 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
