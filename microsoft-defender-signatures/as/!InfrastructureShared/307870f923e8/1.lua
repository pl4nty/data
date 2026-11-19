-- Threat: !InfrastructureShared
-- Name: 307870f923e8
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
