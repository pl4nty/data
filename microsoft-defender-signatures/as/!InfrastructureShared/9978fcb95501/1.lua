-- Threat: !InfrastructureShared
-- Name: 9978fcb95501
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
