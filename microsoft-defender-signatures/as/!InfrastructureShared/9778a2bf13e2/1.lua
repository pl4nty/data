-- Threat: !InfrastructureShared
-- Name: 9778a2bf13e2
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
