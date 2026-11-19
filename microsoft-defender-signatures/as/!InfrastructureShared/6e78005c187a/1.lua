-- Threat: !InfrastructureShared
-- Name: 6e78005c187a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
