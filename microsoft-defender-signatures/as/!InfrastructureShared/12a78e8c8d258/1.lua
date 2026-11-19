-- Threat: !InfrastructureShared
-- Name: 12a78e8c8d258
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
