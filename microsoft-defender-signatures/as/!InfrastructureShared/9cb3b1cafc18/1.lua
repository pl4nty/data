-- Threat: !InfrastructureShared
-- Name: 9cb3b1cafc18
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "explorer.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
