-- Threat: !InfrastructureShared
-- Name: 5278ff586320
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
