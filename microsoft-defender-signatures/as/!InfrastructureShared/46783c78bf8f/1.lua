-- Threat: !InfrastructureShared
-- Name: 46783c78bf8f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 12582912 and mp.getfilesize() < 13631488 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
