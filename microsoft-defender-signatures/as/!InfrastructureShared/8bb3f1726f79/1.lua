-- Threat: !InfrastructureShared
-- Name: 8bb3f1726f79
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.sub(l_0_0, -12) ~= "iexplore.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
