-- Threat: !InfrastructureShared
-- Name: 59785c224d59
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
