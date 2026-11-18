-- Threat: !InfrastructureShared
-- Name: 45784af2c30f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
