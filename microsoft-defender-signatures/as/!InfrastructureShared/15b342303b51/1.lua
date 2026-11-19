-- Threat: !InfrastructureShared
-- Name: 15b342303b51
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.match(l_0_0, "\\outlook.exe$") or string.match(l_0_0, "\\olk.exe$") then
  return mp.INFECTED
end
return mp.CLEAN
