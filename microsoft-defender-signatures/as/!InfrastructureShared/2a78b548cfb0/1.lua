-- Threat: !InfrastructureShared
-- Name: 2a78b548cfb0
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
