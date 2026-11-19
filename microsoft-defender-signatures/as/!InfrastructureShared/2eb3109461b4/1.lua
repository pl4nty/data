-- Threat: !InfrastructureShared
-- Name: 2eb3109461b4
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\virtualbox", 1, true) or string.find(l_0_0, "msmpeng.exe", 1, true) or string.find(l_0_0, "mrt.exe", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
