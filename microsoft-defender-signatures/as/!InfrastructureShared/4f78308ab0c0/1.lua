-- Threat: !InfrastructureShared
-- Name: 4f78308ab0c0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
