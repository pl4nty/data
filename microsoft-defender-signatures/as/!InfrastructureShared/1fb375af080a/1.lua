-- Threat: !InfrastructureShared
-- Name: 1fb375af080a
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.find(l_0_0, "\\explorer.exe") ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
