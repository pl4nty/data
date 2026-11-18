-- Threat: !InfrastructureShared
-- Name: 13a7869295978
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
