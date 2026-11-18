-- Threat: !InfrastructureShared
-- Name: 5c78f4103af3
-- Type: 21

if peattributes.isexe == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_0 = mp.getfilesize()
  if 3000000 < l_0_0 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
