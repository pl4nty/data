-- Threat: !InfrastructureShared
-- Name: 40781c903e2d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
