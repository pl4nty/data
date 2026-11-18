-- Threat: !InfrastructureShared
-- Name: e2785239c1a2
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
