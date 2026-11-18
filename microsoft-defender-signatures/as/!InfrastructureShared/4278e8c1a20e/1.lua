-- Threat: !InfrastructureShared
-- Name: 4278e8c1a20e
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 282624 <= l_0_0 and l_0_0 <= 331776 then
  return mp.INFECTED
end
return mp.CLEAN
