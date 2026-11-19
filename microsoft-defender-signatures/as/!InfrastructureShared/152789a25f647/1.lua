-- Threat: !InfrastructureShared
-- Name: 152789a25f647
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
