-- Threat: !InfrastructureShared
-- Name: 95b30c0189ad
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "\\appdata\\roaming\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
