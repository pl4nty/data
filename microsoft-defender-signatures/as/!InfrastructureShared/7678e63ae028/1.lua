-- Threat: !InfrastructureShared
-- Name: 7678e63ae028
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
