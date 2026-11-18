-- Threat: !InfrastructureShared
-- Name: 8378c5b317ec
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
