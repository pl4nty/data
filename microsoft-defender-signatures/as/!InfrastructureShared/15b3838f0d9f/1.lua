-- Threat: !InfrastructureShared
-- Name: 15b3838f0d9f
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -11))
  if l_0_0 == "winword.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
