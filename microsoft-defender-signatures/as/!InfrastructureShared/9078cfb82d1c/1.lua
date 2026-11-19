-- Threat: !InfrastructureShared
-- Name: 9078cfb82d1c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
