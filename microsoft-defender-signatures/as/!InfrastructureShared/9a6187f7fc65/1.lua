-- Threat: !InfrastructureShared
-- Name: 9a6187f7fc65
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil and l_0_0 < 720896 and 50000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
