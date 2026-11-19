-- Threat: !InfrastructureShared
-- Name: 8078ed1041b7
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
