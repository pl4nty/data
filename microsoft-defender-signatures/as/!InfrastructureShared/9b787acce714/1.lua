-- Threat: !InfrastructureShared
-- Name: 9b787acce714
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 153600 then
  return mp.INFECTED
end
return mp.CLEAN
