-- Threat: !InfrastructureShared
-- Name: 30678180d4e35
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
