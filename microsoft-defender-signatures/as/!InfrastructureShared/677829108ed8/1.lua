-- Threat: !InfrastructureShared
-- Name: 677829108ed8
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
