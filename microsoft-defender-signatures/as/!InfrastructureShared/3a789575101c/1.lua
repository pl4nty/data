-- Threat: !InfrastructureShared
-- Name: 3a789575101c
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 1048576 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
