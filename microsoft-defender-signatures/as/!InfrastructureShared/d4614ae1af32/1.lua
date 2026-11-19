-- Threat: !InfrastructureShared
-- Name: d4614ae1af32
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
