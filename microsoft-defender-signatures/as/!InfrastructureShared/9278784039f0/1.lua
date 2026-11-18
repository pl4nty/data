-- Threat: !InfrastructureShared
-- Name: 9278784039f0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
