-- Threat: !InfrastructureShared
-- Name: d778745d6b82
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
