-- Threat: !InfrastructureShared
-- Name: 3378f28ff184
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
