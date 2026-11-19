-- Threat: !InfrastructureShared
-- Name: 39783cdb83af
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
