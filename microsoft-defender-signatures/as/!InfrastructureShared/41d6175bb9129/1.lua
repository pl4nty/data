-- Threat: !InfrastructureShared
-- Name: 41d6175bb9129
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
