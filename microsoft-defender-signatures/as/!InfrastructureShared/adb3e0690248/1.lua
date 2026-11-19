-- Threat: !InfrastructureShared
-- Name: adb3e0690248
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.sub(l_0_0, -10) == "/sbin/aide" then
  return mp.CLEAN
end
return mp.INFECTED
