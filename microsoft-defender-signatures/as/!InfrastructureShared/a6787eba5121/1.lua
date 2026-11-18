-- Threat: !InfrastructureShared
-- Name: a6787eba5121
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and l_0_0 < 655360 and 70000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
