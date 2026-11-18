-- Threat: !InfrastructureShared
-- Name: b578c7c5eea7
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
