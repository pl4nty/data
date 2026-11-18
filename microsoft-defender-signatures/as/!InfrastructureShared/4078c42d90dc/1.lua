-- Threat: !InfrastructureShared
-- Name: 4078c42d90dc
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() > 100000 and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
