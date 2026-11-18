-- Threat: !InfrastructureShared
-- Name: f778886bb42d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
