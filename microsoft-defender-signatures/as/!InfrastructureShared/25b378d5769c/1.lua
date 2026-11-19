-- Threat: !InfrastructureShared
-- Name: 25b378d5769c
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -13))
if l_0_0 == "\\wmiprvse.exe" then
  return mp.INFECTED
end
return mp.CLEAN
