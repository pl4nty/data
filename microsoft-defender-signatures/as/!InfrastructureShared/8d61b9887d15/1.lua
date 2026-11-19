-- Threat: !InfrastructureShared
-- Name: 8d61b9887d15
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
