-- Threat: !InfrastructureShared
-- Name: 2e788f9fdab7
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 299008 <= l_0_0 and l_0_0 <= 350208 then
  return mp.INFECTED
end
return mp.CLEAN
