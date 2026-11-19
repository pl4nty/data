-- Threat: !InfrastructureShared
-- Name: 5d781ce4d278
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() > 73400320 and mp.getfilesize() < 83886080 then
  return mp.INFECTED
end
return mp.CLEAN
