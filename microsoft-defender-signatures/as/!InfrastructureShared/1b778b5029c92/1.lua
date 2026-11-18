-- Threat: !InfrastructureShared
-- Name: 1b778b5029c92
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
