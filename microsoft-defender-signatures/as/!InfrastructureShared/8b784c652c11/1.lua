-- Threat: !InfrastructureShared
-- Name: 8b784c652c11
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
