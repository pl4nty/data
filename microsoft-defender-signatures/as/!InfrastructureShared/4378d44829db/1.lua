-- Threat: !InfrastructureShared
-- Name: 4378d44829db
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
