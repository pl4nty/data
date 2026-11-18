-- Threat: !InfrastructureShared
-- Name: 6c78e0f0ea87
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
