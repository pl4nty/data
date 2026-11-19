-- Threat: !InfrastructureShared
-- Name: 3778d4cb2d39
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
