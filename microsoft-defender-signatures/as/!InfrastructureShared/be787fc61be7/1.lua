-- Threat: !InfrastructureShared
-- Name: be787fc61be7
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == false and 135168 <= l_0_0 and l_0_0 <= 163840 then
  return mp.INFECTED
end
return mp.CLEAN
