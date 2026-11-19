-- Threat: !InfrastructureShared
-- Name: 357871d9763a
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 90112 then
  return mp.INFECTED
end
return mp.CLEAN
