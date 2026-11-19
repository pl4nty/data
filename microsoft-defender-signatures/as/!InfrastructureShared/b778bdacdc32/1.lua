-- Threat: !InfrastructureShared
-- Name: b778bdacdc32
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and l_0_0 == mp.HSTR_CALLER_SMS then
  return mp.INFECTED
end
if peattributes.isexe == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_1 = mp.getfilesize()
  if 3000000 < l_0_1 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
