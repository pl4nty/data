-- Threat: !InfrastructureShared
-- Name: df78e5a21179
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
