-- Threat: !InfrastructureShared
-- Name: 6f78d017bb33
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
