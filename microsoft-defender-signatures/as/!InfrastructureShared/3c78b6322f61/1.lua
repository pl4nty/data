-- Threat: !InfrastructureShared
-- Name: 3c78b6322f61
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
