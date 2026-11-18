-- Threat: !InfrastructureShared
-- Name: 25b3cb08089e
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -12) == "rundll32.exe" then
  return mp.INFECTED
end
return mp.CLEAN
