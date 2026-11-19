-- Threat: !InfrastructureShared
-- Name: 9d785f54c791
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
