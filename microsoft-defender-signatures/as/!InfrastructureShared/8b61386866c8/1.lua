-- Threat: !InfrastructureShared
-- Name: 8b61386866c8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 <= 655360 and 598016 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
