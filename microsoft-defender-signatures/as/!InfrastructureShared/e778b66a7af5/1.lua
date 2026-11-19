-- Threat: !InfrastructureShared
-- Name: e778b66a7af5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
