-- Threat: !InfrastructureShared
-- Name: 18e784486d2b0
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
