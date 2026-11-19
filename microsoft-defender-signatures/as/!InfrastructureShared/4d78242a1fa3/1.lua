-- Threat: !InfrastructureShared
-- Name: 4d78242a1fa3
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
