-- Threat: !InfrastructureShared
-- Name: 3c7809fdc799
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 19712 then
  return mp.INFECTED
end
return mp.CLEAN
