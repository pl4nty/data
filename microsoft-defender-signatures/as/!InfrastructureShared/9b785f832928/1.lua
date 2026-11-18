-- Threat: !InfrastructureShared
-- Name: 9b785f832928
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
