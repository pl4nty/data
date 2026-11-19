-- Threat: !InfrastructureShared
-- Name: b5785d14663f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
