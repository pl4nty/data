-- Threat: !InfrastructureShared
-- Name: 4478b06c8840
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
