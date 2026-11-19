-- Threat: !InfrastructureShared
-- Name: 597844f6abfb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
