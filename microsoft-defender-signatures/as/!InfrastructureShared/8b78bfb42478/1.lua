-- Threat: !InfrastructureShared
-- Name: 8b78bfb42478
-- Type: 21

if peattributes.amd64_image and mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
