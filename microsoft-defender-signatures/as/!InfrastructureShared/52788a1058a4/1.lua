-- Threat: !InfrastructureShared
-- Name: 52788a1058a4
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 6400000 and mp.getfilesize() < 9000000 then
  return mp.INFECTED
end
return mp.CLEAN
