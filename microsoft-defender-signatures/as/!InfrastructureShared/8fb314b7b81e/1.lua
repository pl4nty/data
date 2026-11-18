-- Threat: !InfrastructureShared
-- Name: 8fb314b7b81e
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 and string.find(string.lower(l_0_0), "\\chrome\\", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
