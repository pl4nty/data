-- Threat: !InfrastructureShared
-- Name: 854030b029e9
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
