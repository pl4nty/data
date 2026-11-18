-- Threat: !InfrastructureShared
-- Name: 5678ce016442
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 230000 and mp.getfilesize() < 240000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
