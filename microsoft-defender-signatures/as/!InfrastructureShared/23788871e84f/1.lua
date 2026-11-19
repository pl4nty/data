-- Threat: !InfrastructureShared
-- Name: 23788871e84f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == false and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
