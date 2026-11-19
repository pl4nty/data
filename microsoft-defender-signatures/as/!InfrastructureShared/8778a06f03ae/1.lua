-- Threat: !InfrastructureShared
-- Name: 8778a06f03ae
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
