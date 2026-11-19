-- Threat: !InfrastructureShared
-- Name: 15b3366afe40
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -13))
if string.find(l_0_0, "\\excel.exe", 1, true) or string.find(l_0_0, "\\powerpnt.exe", 1, true) or string.find(l_0_0, "\\winword.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
