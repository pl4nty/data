-- Threat: !InfrastructureShared
-- Name: 15b3374917db
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -13))
  if l_0_0 == "\\wmiprvse.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
