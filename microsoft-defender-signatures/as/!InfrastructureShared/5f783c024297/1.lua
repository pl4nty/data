-- Threat: !InfrastructureShared
-- Name: 5f783c024297
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
