-- Threat: !InfrastructureShared
-- Name: bb78149643b9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
