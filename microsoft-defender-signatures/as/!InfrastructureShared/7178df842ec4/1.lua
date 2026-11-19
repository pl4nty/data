-- Threat: !InfrastructureShared
-- Name: 7178df842ec4
-- Type: 21

if mp.get_mpattribute("pea_amd64_image") and mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
