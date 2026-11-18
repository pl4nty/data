-- Threat: !InfrastructureShared
-- Name: 2b78468b4de2
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
