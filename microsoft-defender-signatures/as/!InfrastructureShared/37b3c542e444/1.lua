-- Threat: !InfrastructureShared
-- Name: 37b3c542e444
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -12) == "rundll32.exe" then
  return mp.INFECTED
end
return mp.CLEAN
