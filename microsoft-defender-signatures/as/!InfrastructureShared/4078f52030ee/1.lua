-- Threat: !InfrastructureShared
-- Name: 4078f52030ee
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
