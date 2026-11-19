-- Threat: !InfrastructureShared
-- Name: 10d7865d0f87d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
