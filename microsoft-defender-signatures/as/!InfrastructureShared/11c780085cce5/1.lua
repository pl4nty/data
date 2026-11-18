-- Threat: !InfrastructureShared
-- Name: 11c780085cce5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
