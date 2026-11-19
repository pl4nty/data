-- Threat: !InfrastructureShared
-- Name: d378d9047250
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
