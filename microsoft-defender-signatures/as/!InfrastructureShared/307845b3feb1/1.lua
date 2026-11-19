-- Threat: !InfrastructureShared
-- Name: 307845b3feb1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
