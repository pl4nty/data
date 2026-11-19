-- Threat: !InfrastructureShared
-- Name: 7b78d0958f3b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
