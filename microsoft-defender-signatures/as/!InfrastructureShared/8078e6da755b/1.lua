-- Threat: !InfrastructureShared
-- Name: 8078e6da755b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
