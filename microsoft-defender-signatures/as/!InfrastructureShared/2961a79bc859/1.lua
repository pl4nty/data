-- Threat: !InfrastructureShared
-- Name: 2961a79bc859
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and 458752 < l_0_0 and l_0_0 < 589824 then
  return mp.INFECTED
end
return mp.LOWFI
