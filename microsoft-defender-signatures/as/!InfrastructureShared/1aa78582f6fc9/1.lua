-- Threat: !InfrastructureShared
-- Name: 1aa78582f6fc9
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
