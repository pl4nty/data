-- Threat: !InfrastructureShared
-- Name: 10078be92df1d
-- Type: 21

if peattributes.isexe == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_0 = mp.getfilesize()
  if 500000 < l_0_0 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
