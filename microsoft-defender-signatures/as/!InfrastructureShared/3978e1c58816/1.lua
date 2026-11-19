-- Threat: !InfrastructureShared
-- Name: 3978e1c58816
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
