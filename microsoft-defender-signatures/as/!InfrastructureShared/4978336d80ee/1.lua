-- Threat: !InfrastructureShared
-- Name: 4978336d80ee
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
