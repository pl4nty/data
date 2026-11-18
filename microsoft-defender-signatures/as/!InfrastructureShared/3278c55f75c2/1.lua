-- Threat: !InfrastructureShared
-- Name: 3278c55f75c2
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
