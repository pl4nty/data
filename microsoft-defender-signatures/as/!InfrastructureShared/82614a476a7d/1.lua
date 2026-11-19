-- Threat: !InfrastructureShared
-- Name: 82614a476a7d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
