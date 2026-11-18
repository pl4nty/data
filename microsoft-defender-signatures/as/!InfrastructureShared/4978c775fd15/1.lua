-- Threat: !InfrastructureShared
-- Name: 4978c775fd15
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
