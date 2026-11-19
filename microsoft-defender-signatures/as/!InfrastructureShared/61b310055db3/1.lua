-- Threat: !InfrastructureShared
-- Name: 61b310055db3
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 and string.find(string.lower(l_0_0), "\\edge\\", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
