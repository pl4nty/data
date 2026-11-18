-- Threat: !InfrastructureShared
-- Name: 15b398af535b
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -12))
  if l_0_0 == "rundll32.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
