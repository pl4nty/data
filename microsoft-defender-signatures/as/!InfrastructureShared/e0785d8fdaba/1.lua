-- Threat: !InfrastructureShared
-- Name: e0785d8fdaba
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 327680 then
  return mp.INFECTED
end
return mp.CLEAN
