-- Threat: !InfrastructureShared
-- Name: 45b34b1262de
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -12))
if string.find(l_0_0, "\\wuauclt.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
