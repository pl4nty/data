-- Threat: !InfrastructureShared
-- Name: 45783550b004
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
