-- Threat: !InfrastructureShared
-- Name: 3178db1f88fc
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
