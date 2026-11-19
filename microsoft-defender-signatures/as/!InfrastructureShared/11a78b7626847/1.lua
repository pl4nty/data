-- Threat: !InfrastructureShared
-- Name: 11a78b7626847
-- Type: 21

if peattributes.isexe and mp.getfilesize() >= 65536 and mp.getfilesize() <= 1048576 and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
