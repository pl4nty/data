-- Threat: !InfrastructureShared
-- Name: 1d2b3dc6e61c0
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -8) == "ekrn.exe" then
  return mp.CLEAN
end
return mp.INFECTED
