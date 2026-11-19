-- Threat: !InfrastructureShared
-- Name: 1a9784006d5f1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
