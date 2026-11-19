-- Threat: !InfrastructureShared
-- Name: 2540a618fe73
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
