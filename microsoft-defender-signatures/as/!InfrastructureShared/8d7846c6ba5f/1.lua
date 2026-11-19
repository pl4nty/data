-- Threat: !InfrastructureShared
-- Name: 8d7846c6ba5f
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 2000000 and mp.getfilesize() < 3000000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
