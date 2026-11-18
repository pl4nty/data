-- Threat: !InfrastructureShared
-- Name: 56789139dd39
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
