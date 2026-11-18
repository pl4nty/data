-- Threat: !InfrastructureShared
-- Name: b3786844ff37
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= nil and l_0_0 == mp.HSTR_CALLER_SMS then
  return mp.INFECTED
end
if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  if not mp.get_mpattribute("RPF:TopLevelFile") then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilesize()
  if 3000000 < l_0_1 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
