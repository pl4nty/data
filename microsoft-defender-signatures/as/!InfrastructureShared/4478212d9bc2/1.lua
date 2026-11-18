-- Threat: !InfrastructureShared
-- Name: 4478212d9bc2
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() < 102000 then
  return mp.INFECTED
end
return mp.CLEAN
