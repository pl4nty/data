-- Threat: !InfrastructureShared
-- Name: 3978e1cb11bb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
