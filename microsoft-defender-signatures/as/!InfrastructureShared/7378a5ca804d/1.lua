-- Threat: !InfrastructureShared
-- Name: 7378a5ca804d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
