-- Threat: !InfrastructureShared
-- Name: 4878e3399950
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
