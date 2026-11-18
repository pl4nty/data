-- Threat: !InfrastructureShared
-- Name: 15b32ab2af99
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -11) == "svchost.exe" or string.sub(l_0_0, -12) == "rundll32.exe" or string.sub(l_0_0, -12) == "regsvr32.exe" then
  return mp.CLEAN
end
return mp.INFECTED
