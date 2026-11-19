-- Threat: !InfrastructureShared
-- Name: 70786a061973
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
