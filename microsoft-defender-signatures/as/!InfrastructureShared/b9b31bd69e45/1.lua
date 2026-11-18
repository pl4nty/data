-- Threat: !InfrastructureShared
-- Name: b9b31bd69e45
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\mmc.exe") then
  return mp.CLEAN
elseif string.find(l_0_0, "\\officeclicktorun.exe") then
  return mp.CLEAN
end
return mp.INFECTED
