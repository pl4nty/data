-- Threat: !InfrastructureShared
-- Name: 2c7821349688
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
