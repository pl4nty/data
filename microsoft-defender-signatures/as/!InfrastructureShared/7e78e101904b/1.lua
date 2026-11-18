-- Threat: !InfrastructureShared
-- Name: 7e78e101904b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
