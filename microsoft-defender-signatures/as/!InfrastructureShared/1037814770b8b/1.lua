-- Threat: !InfrastructureShared
-- Name: 1037814770b8b
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 282624 then
  return mp.INFECTED
end
return mp.CLEAN
