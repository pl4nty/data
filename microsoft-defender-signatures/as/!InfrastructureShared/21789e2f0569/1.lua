-- Threat: !InfrastructureShared
-- Name: 21789e2f0569
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
if peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
