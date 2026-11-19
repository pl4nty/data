-- Threat: !InfrastructureShared
-- Name: 1a061d438d4a2
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
