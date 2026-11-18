-- Threat: !InfrastructureShared
-- Name: 81b3c180e2f5
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -12))
if l_0_0 ~= "\\svchost.exe" then
  return mp.CLEAN
end
return mp.INFECTED
