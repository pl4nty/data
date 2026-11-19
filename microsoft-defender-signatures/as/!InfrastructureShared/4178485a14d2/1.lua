-- Threat: !InfrastructureShared
-- Name: 4178485a14d2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
