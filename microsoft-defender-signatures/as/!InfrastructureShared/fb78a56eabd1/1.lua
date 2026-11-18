-- Threat: !InfrastructureShared
-- Name: fb78a56eabd1
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 34000 and mp.getfilesize() < 38000 and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
