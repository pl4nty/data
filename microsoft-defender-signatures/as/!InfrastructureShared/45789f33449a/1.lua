-- Threat: !InfrastructureShared
-- Name: 45789f33449a
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 200000 and mp.getfilesize() < 210000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
