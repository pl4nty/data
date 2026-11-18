-- Threat: !InfrastructureShared
-- Name: 977810de4d16
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
