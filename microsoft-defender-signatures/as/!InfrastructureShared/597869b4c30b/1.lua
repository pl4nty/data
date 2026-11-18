-- Threat: !InfrastructureShared
-- Name: 597869b4c30b
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
