-- Threat: !InfrastructureShared
-- Name: 6278033dc6a1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
