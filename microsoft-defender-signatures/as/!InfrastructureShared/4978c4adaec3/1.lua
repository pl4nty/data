-- Threat: !InfrastructureShared
-- Name: 4978c4adaec3
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
