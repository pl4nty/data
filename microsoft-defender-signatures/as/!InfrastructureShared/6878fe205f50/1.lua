-- Threat: !InfrastructureShared
-- Name: 6878fe205f50
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
