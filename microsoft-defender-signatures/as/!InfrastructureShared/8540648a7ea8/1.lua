-- Threat: !InfrastructureShared
-- Name: 8540648a7ea8
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
