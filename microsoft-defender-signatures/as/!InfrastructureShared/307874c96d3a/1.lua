-- Threat: !InfrastructureShared
-- Name: 307874c96d3a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
