-- Threat: !InfrastructureShared
-- Name: 10678f34d9baa
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
