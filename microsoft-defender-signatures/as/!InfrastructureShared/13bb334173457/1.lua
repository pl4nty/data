-- Threat: !InfrastructureShared
-- Name: 13bb334173457
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -11) == "msmpeng.exe" then
  return mp.CLEAN
end
return mp.INFECTED
