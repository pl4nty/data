-- Threat: !InfrastructureShared
-- Name: 30784052a903
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
