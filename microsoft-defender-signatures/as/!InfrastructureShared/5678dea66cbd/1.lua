-- Threat: !InfrastructureShared
-- Name: 5678dea66cbd
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
