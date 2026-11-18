-- Threat: !InfrastructureShared
-- Name: 8a61943b7459
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
