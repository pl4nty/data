-- Threat: !InfrastructureShared
-- Name: c278a4f9e0e9
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 12582912 and mp.getfilesize() < 13631488 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
