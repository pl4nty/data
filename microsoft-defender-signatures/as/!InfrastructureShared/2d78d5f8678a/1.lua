-- Threat: !InfrastructureShared
-- Name: 2d78d5f8678a
-- Type: 21

if peattributes.no_security == true and pesecs[1].Name == "AUTO" then
  return mp.INFECTED
end
return mp.CLEAN
