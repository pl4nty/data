-- Threat: !InfrastructureShared
-- Name: 36f783c72e93e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
