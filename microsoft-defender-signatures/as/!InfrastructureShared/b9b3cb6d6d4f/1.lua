-- Threat: !InfrastructureShared
-- Name: b9b3cb6d6d4f
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "explorer.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
