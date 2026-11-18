-- Threat: !InfrastructureShared
-- Name: 687872ca3f8d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
