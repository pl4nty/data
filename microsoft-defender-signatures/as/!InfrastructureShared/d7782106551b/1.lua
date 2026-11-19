-- Threat: !InfrastructureShared
-- Name: d7782106551b
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil and 3145728 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
