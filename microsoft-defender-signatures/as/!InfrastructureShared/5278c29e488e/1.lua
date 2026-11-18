-- Threat: !InfrastructureShared
-- Name: 5278c29e488e
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 275000 and mp.getfilesize() < 300000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
