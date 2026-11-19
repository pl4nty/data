-- Threat: !InfrastructureShared
-- Name: 15b371a21aa5
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -13))
if string.find(l_0_0, "\\services.exe", 1, true) or string.find(l_0_0, "\\svchost.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
