-- Threat: !InfrastructureShared
-- Name: 7b7803dc5e0a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
