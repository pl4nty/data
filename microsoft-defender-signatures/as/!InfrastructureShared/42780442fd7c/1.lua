-- Threat: !InfrastructureShared
-- Name: 42780442fd7c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
