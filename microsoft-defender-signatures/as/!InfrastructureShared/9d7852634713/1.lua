-- Threat: !InfrastructureShared
-- Name: 9d7852634713
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
