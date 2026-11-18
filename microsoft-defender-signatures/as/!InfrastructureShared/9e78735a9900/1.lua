-- Threat: !InfrastructureShared
-- Name: 9e78735a9900
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
