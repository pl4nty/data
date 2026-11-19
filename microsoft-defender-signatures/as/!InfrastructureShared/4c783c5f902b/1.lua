-- Threat: !InfrastructureShared
-- Name: 4c783c5f902b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
