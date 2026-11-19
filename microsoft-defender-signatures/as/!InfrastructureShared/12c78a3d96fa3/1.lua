-- Threat: !InfrastructureShared
-- Name: 12c78a3d96fa3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
