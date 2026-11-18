-- Threat: !InfrastructureShared
-- Name: 1bb61aed0a350
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
