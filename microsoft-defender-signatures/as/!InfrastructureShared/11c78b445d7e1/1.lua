-- Threat: !InfrastructureShared
-- Name: 11c78b445d7e1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
