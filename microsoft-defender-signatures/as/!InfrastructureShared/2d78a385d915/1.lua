-- Threat: !InfrastructureShared
-- Name: 2d78a385d915
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
