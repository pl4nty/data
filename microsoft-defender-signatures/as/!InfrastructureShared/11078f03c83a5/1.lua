-- Threat: !InfrastructureShared
-- Name: 11078f03c83a5
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
