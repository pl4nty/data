-- Threat: !InfrastructureShared
-- Name: 5878dbcda350
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 1000000 and mp.getfilesize() < 4000000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
