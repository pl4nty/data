-- Threat: !InfrastructureShared
-- Name: 19b38b2d42cb
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 then
  if string.find(string.lower(l_0_0), "\\google\\chrome\\", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
