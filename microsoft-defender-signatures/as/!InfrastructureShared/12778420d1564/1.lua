-- Threat: !InfrastructureShared
-- Name: 12778420d1564
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
