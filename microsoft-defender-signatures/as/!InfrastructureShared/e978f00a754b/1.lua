-- Threat: !InfrastructureShared
-- Name: e978f00a754b
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 491520 <= l_0_0 and l_0_0 <= 524288 then
  return mp.INFECTED
end
return mp.CLEAN
