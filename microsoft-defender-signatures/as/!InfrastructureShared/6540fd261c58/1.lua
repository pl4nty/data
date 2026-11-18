-- Threat: !InfrastructureShared
-- Name: 6540fd261c58
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
