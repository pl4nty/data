-- Threat: !InfrastructureShared
-- Name: 3578251cc3a4
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 251530 then
  return mp.INFECTED
end
return mp.CLEAN
