-- Threat: !InfrastructureShared
-- Name: 13a78bbd3b874
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
