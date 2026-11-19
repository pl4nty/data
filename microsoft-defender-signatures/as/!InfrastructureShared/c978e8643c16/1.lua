-- Threat: !InfrastructureShared
-- Name: c978e8643c16
-- Type: 21

if peattributes.isexe == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_0 = mp.getfilesize()
  if 500000 < l_0_0 then
    return mp.LOWFI
  end
  return mp.INFECTED
end
return mp.CLEAN
