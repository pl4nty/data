-- Threat: !InfrastructureShared
-- Name: 8e78d1a92b4c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
