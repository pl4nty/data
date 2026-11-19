-- Threat: !InfrastructureShared
-- Name: 6278bc9dcf19
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
