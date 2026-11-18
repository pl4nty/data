-- Threat: !InfrastructureShared
-- Name: 15b3b1af5db2
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -29))
  if l_0_0 == "\\windows defender\\msmpeng.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
