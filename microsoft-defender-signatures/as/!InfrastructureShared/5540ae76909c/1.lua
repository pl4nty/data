-- Threat: !InfrastructureShared
-- Name: 5540ae76909c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
