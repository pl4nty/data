-- Threat: !InfrastructureShared
-- Name: 135786d0f038b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
