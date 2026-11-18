-- Threat: !InfrastructureShared
-- Name: 8a78e5ef2a37
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
