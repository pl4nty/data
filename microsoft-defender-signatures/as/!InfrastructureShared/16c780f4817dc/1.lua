-- Threat: !InfrastructureShared
-- Name: 16c780f4817dc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
