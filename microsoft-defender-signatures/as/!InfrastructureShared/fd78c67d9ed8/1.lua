-- Threat: !InfrastructureShared
-- Name: fd78c67d9ed8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
