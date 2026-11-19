-- Threat: !InfrastructureShared
-- Name: b5789890af07
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
