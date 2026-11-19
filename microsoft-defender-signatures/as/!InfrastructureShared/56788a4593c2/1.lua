-- Threat: !InfrastructureShared
-- Name: 56788a4593c2
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
