-- Threat: !InfrastructureShared
-- Name: 2f787025cb36
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
