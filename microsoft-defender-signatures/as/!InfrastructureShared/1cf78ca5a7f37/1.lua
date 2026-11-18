-- Threat: !InfrastructureShared
-- Name: 1cf78ca5a7f37
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
