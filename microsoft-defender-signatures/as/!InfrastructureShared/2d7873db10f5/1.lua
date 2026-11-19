-- Threat: !InfrastructureShared
-- Name: 2d7873db10f5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
