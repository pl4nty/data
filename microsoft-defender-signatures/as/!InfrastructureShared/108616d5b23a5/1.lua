-- Threat: !InfrastructureShared
-- Name: 108616d5b23a5
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 264704 <= l_0_0 and l_0_0 <= 277272 then
  return mp.INFECTED
end
return mp.CLEAN
