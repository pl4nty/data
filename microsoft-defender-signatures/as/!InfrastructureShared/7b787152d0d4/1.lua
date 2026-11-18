-- Threat: !InfrastructureShared
-- Name: 7b787152d0d4
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
