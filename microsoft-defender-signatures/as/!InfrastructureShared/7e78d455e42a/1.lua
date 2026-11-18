-- Threat: !InfrastructureShared
-- Name: 7e78d455e42a
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 172032 then
  return mp.INFECTED
end
return mp.CLEAN
