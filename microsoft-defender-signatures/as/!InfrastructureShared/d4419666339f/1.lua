-- Threat: !InfrastructureShared
-- Name: d4419666339f
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
