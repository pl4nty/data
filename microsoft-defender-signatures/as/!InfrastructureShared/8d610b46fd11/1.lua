-- Threat: !InfrastructureShared
-- Name: 8d610b46fd11
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
