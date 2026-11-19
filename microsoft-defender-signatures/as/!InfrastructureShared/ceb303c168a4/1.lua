-- Threat: !InfrastructureShared
-- Name: ceb303c168a4
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\werfault.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
