-- Threat: !InfrastructureShared
-- Name: 3d7822521ee3
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 51200 and peattributes.isdll and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
