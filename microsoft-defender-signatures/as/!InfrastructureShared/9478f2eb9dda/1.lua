-- Threat: !InfrastructureShared
-- Name: 9478f2eb9dda
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
