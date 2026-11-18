-- Threat: !InfrastructureShared
-- Name: 4978eb0d304a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
