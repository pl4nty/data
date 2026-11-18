-- Threat: !InfrastructureShared
-- Name: 9b61f9b13f6e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
