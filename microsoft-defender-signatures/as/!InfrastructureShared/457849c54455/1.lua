-- Threat: !InfrastructureShared
-- Name: 457849c54455
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
