-- Threat: !InfrastructureShared
-- Name: ae78c912eb59
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
