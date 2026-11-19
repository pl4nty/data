-- Threat: !InfrastructureShared
-- Name: 2e978a8cd7e91
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 40960 then
  return mp.INFECTED
end
return mp.CLEAN
