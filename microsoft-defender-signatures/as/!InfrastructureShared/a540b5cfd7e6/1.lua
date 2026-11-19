-- Threat: !InfrastructureShared
-- Name: a540b5cfd7e6
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
