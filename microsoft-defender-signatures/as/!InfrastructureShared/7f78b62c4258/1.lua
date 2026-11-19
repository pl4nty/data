-- Threat: !InfrastructureShared
-- Name: 7f78b62c4258
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
