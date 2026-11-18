-- Threat: !InfrastructureShared
-- Name: 7378e8a7bcd3
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
