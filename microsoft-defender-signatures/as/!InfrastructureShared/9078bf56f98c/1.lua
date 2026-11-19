-- Threat: !InfrastructureShared
-- Name: 9078bf56f98c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
