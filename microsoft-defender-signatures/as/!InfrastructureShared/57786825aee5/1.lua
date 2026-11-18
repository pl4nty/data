-- Threat: !InfrastructureShared
-- Name: 57786825aee5
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 296000 and mp.getfilesize() < 310000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
