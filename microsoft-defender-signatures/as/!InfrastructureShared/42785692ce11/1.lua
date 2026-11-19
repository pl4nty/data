-- Threat: !InfrastructureShared
-- Name: 42785692ce11
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
