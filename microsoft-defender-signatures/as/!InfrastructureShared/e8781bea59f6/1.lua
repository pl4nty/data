-- Threat: !InfrastructureShared
-- Name: e8781bea59f6
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
