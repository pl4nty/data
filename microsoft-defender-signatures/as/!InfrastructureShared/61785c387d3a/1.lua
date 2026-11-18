-- Threat: !InfrastructureShared
-- Name: 61785c387d3a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
