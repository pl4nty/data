-- Threat: !InfrastructureShared
-- Name: d1783a29c90a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
