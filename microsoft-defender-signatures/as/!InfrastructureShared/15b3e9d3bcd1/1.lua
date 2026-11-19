-- Threat: !InfrastructureShared
-- Name: 15b3e9d3bcd1
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -10))
if l_0_0 == "\\mshta.exe" then
  return mp.INFECTED
end
return mp.CLEAN
