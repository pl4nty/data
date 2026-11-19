-- Threat: !InfrastructureShared
-- Name: 63610642cc02
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == false and l_0_0 <= 589824 and 458752 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
