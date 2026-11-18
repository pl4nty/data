-- Threat: !InfrastructureShared
-- Name: e4781c457558
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 491520 <= l_0_0 and l_0_0 <= 536576 then
  return mp.INFECTED
end
return mp.CLEAN
