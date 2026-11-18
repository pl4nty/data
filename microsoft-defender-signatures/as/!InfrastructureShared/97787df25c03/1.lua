-- Threat: !InfrastructureShared
-- Name: 97787df25c03
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
