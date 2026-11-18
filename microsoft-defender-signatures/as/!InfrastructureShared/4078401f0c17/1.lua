-- Threat: !InfrastructureShared
-- Name: 4078401f0c17
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
