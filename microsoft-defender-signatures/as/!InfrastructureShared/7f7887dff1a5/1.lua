-- Threat: !InfrastructureShared
-- Name: 7f7887dff1a5
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 618496 then
  return mp.INFECTED
end
return mp.CLEAN
