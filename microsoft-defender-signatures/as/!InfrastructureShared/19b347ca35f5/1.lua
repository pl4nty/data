-- Threat: !InfrastructureShared
-- Name: 19b347ca35f5
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -12) == "sqlservr.exe" then
  return mp.INFECTED
end
return mp.CLEAN
