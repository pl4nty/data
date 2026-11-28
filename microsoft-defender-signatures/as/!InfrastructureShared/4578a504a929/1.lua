-- Threat: !InfrastructureShared
-- Name: 4578a504a929
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
