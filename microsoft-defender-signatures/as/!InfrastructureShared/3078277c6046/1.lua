-- Threat: !InfrastructureShared
-- Name: 3078277c6046
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
