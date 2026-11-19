-- Threat: !InfrastructureShared
-- Name: 607822276819
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 61440 then
  return mp.INFECTED
end
return mp.CLEAN
