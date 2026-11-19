-- Threat: !InfrastructureShared
-- Name: 13a78a2844ab9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
