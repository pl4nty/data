-- Threat: !InfrastructureShared
-- Name: 12540ec737676
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
