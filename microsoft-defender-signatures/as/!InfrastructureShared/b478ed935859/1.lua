-- Threat: !InfrastructureShared
-- Name: b478ed935859
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
