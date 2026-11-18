-- Threat: !InfrastructureShared
-- Name: 69780131e809
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
