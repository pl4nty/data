-- Threat: !InfrastructureShared
-- Name: 27789235611f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
