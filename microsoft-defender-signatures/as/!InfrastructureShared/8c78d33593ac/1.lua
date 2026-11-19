-- Threat: !InfrastructureShared
-- Name: 8c78d33593ac
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
