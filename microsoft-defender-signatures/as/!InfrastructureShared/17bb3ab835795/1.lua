-- Threat: !InfrastructureShared
-- Name: 17bb3ab835795
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -11) == "svchost.exe" then
  return mp.CLEAN
end
return mp.INFECTED
