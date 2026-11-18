-- Threat: !InfrastructureShared
-- Name: 9778c48259c9
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
