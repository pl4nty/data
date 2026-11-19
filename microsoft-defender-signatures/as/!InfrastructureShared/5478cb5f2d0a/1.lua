-- Threat: !InfrastructureShared
-- Name: 5478cb5f2d0a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
