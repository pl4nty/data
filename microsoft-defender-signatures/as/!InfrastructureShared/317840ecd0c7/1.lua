-- Threat: !InfrastructureShared
-- Name: 317840ecd0c7
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
