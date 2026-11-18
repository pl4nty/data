-- Threat: !InfrastructureShared
-- Name: 6e78f1521647
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
