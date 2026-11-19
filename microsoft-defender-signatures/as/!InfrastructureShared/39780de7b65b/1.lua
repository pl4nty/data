-- Threat: !InfrastructureShared
-- Name: 39780de7b65b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 20000 and mp.getfilesize() < 30000 then
  return mp.INFECTED
end
return mp.CLEAN
