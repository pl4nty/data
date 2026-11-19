-- Threat: !InfrastructureShared
-- Name: 30786838f0a5
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
