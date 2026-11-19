-- Threat: !InfrastructureShared
-- Name: 113b3ebff077c
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\java.exe", 1, true) or string.find(l_0_0, "\\javaw.exe", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
