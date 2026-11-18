-- Threat: !InfrastructureShared
-- Name: 7c785c098489
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 140000 and mp.getfilesize() < 340000 then
  return mp.INFECTED
end
return mp.CLEAN
