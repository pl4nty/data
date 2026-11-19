-- Threat: !InfrastructureShared
-- Name: 6e78a4e760b1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
