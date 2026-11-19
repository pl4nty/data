-- Threat: !InfrastructureShared
-- Name: 9b78d3463617
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
