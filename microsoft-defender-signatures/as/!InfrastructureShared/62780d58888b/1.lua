-- Threat: !InfrastructureShared
-- Name: 62780d58888b
-- Type: 21

if mp.get_mpattribute("pea_isdll") and mp.get_mpattribute("pea_amd64_image") then
  return mp.INFECTED
end
return mp.CLEAN
