-- Threat: !InfrastructureShared
-- Name: 7378d9517179
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
