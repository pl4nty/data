-- Threat: !InfrastructureShared
-- Name: 5878c8674c1c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 7500000 and mp.getfilesize() < 8105000 then
  return mp.INFECTED
end
return mp.CLEAN
