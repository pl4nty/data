-- Threat: !InfrastructureShared
-- Name: 517833c240a5
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
