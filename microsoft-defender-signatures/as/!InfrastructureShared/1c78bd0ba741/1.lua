-- Threat: !InfrastructureShared
-- Name: 1c78bd0ba741
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
