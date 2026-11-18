-- Threat: !InfrastructureShared
-- Name: a67860cf697b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
