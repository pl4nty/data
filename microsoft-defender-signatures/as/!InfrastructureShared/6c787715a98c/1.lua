-- Threat: !InfrastructureShared
-- Name: 6c787715a98c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
