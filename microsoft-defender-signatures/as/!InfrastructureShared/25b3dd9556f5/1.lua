-- Threat: !InfrastructureShared
-- Name: 25b3dd9556f5
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "\\windows\\", 1, true) == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
