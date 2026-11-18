-- Threat: !InfrastructureShared
-- Name: 1ad782ac63ac8
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
