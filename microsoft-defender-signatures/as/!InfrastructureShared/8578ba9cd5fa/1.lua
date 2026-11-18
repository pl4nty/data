-- Threat: !InfrastructureShared
-- Name: 8578ba9cd5fa
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
