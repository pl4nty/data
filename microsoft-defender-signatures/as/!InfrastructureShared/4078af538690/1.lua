-- Threat: !InfrastructureShared
-- Name: 4078af538690
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
