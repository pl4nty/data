-- Threat: !InfrastructureShared
-- Name: 4a784408ca5c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
