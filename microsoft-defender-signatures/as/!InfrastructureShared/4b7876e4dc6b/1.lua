-- Threat: !InfrastructureShared
-- Name: 4b7876e4dc6b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 49666 then
  return mp.INFECTED
end
return mp.CLEAN
