-- Threat: !InfrastructureShared
-- Name: 7e785a3f985c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
