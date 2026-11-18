-- Threat: !InfrastructureShared
-- Name: 34780e0fd803
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
