-- Threat: !InfrastructureShared
-- Name: 113b3c57d287f
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -11) == "msmpeng.exe" then
  return mp.CLEAN
end
return mp.INFECTED
