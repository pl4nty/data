-- Threat: !InfrastructureShared
-- Name: 9f7838005739
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
