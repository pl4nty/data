-- Threat: !InfrastructureShared
-- Name: 5278db7da91a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
