-- Threat: !InfrastructureShared
-- Name: 4161deb54216
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and l_0_0 <= 2424832 then
  return mp.INFECTED
end
return mp.CLEAN
