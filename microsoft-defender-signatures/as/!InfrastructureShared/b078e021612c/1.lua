-- Threat: !InfrastructureShared
-- Name: b078e021612c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
