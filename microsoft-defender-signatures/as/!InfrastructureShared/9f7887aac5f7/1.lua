-- Threat: !InfrastructureShared
-- Name: 9f7887aac5f7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
