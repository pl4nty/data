-- Threat: !InfrastructureShared
-- Name: 15378c942112a
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
