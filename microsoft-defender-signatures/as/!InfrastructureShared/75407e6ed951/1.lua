-- Threat: !InfrastructureShared
-- Name: 75407e6ed951
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
