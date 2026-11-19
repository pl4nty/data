-- Threat: !InfrastructureShared
-- Name: 6178d0872ac0
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
