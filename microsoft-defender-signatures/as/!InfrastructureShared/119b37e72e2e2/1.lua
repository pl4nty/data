-- Threat: !InfrastructureShared
-- Name: 119b37e72e2e2
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -17) == "microsoftedge.exe" then
  return mp.CLEAN
end
return mp.INFECTED
