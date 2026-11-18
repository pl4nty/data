-- Threat: !InfrastructureShared
-- Name: 26785fb989f8
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
