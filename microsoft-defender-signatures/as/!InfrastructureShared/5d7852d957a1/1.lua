-- Threat: !InfrastructureShared
-- Name: 5d7852d957a1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
