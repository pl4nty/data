-- Threat: !InfrastructureShared
-- Name: 837841952bfc
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
