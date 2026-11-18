-- Threat: !InfrastructureShared
-- Name: 7278c7753698
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
