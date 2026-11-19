-- Threat: !InfrastructureShared
-- Name: 9778b743e383
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
