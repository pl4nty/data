-- Threat: !InfrastructureShared
-- Name: 6c78f81e06e7
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
