-- Threat: !InfrastructureShared
-- Name: 657848a8c8c1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
