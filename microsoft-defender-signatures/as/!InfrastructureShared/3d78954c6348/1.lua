-- Threat: !InfrastructureShared
-- Name: 3d78954c6348
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
