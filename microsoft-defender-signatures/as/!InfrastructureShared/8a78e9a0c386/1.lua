-- Threat: !InfrastructureShared
-- Name: 8a78e9a0c386
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
