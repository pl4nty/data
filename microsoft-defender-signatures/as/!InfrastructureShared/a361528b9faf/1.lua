-- Threat: !InfrastructureShared
-- Name: a361528b9faf
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and peattributes.no_security == true and 458752 <= l_0_0 and l_0_0 <= 589824 then
  return mp.INFECTED
end
return mp.CLEAN
