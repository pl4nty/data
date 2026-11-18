-- Threat: !InfrastructureShared
-- Name: 4c78d545a95d
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 400000 and mp.getfilesize() < 450000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
