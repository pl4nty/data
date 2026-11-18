-- Threat: !InfrastructureShared
-- Name: 49788daae27e
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 445000 and mp.getfilesize() < 475000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
