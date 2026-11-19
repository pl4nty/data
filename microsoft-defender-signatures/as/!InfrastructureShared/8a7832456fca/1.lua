-- Threat: !InfrastructureShared
-- Name: 8a7832456fca
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
