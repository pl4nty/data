-- Threat: !InfrastructureShared
-- Name: 9c780426b81d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
