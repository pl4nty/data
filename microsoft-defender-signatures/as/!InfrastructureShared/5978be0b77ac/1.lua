-- Threat: !InfrastructureShared
-- Name: 5978be0b77ac
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
