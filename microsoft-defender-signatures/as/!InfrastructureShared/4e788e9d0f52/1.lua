-- Threat: !InfrastructureShared
-- Name: 4e788e9d0f52
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
